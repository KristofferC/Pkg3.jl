module Operations

using Base.Random: UUID
using Base: LibGit2
using Pkg3.TerminalMenus
using Pkg3.Types
import Pkg3: Pkg2, depots, BinaryProvider, USE_LIBGIT2_FOR_ALL_DOWNLOADS, NUM_CONCURRENT_DOWNLOADS

const SlugInt = UInt32 # max p = 4
const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
const nchars = SlugInt(length(chars))
const max_p = floor(Int, log(nchars, typemax(SlugInt) >>> 8))

function slug(x::SlugInt, p::Int)
    1 ≤ p ≤ max_p || # otherwise previous steps are wrong
        error("invalid slug size: $p (need 1 ≤ p ≤ $max_p)")
    return sprint() do io
        for i = 1:p
            x, d = divrem(x, nchars)
            write(io, chars[1+d])
        end
    end
end
slug(x::Integer, p::Int) = slug(SlugInt(x), p)

function slug(bytes::Vector{UInt8}, p::Int)
    n = nchars^p
    x = zero(SlugInt)
    for (i, b) in enumerate(bytes)
        x = (x + b*powermod(2, 8(i-1), n)) % n
    end
    slug(x, p)
end

slug(uuid::UUID, p::Int=4) = slug(uuid.value % nchars^p, p)
slug(sha1::SHA1, p::Int=4) = slug(sha1.bytes, p)

version_slug(uuid::UUID, sha1::SHA1) = joinpath(slug(uuid), slug(sha1))

function find_installed(uuid::UUID, sha1::SHA1)
    slug = version_slug(uuid, sha1)
    for depot in depots()
        path = abspath(depot, "packages", slug)
        ispath(path) && return path
    end
    return abspath(depots()[1], "packages", slug)
end

function package_env_info(pkg::String, env::EnvCache = EnvCache(); verb::String = "choose")
    project = env.project
    manifest = env.manifest
    haskey(manifest, pkg) || return nothing
    infos = manifest[pkg]
    isempty(infos) && return nothing
    if haskey(project, "deps") && haskey(project["deps"], pkg)
        uuid = project["deps"][pkg]
        filter!(infos) do info
            haskey(info, "uuid") && info["uuid"] == uuid
        end
        length(infos) < 1 &&
            cmderror("manifest has no stanza for $pkg/$uuid")
        length(infos) > 1 &&
            cmderror("manifest has multiple stanzas for $pkg/$uuid")
        return first(infos)
    elseif length(infos) == 1
        return first(infos)
    else
        options = String[]
        paths = convert(Dict{String,Vector{String}}, find_registered(pkg))
        for info in infos
            uuid = info["uuid"]
            option = uuid
            if haskey(paths, uuid)
                for path in paths[uuid]
                    info′ = parse_toml(path, "package.toml")
                    option *= " – $(info′["repo"])"
                    break
                end
            else
                option *= " – (unregistred)"
            end
            push!(options, option)
        end
        menu = RadioMenu(options)
        choice = request("Which $pkg package do you want to use:", menu)
        choice == -1 && cmderror("Package load aborted")
        return infos[choice]
    end
end

get_or_make(::Type{T}, d::Dict{K}, k::K) where {T,K} =
    haskey(d, k) ? convert(T, d[k]) : T()

function load_versions(path::String)
    toml = parse_toml(path, "versions.toml")
    Dict(VersionNumber(ver) => SHA1(info["hash-sha1"]) for (ver, info) in toml)
end

function load_package_data(f::Base.Callable, path::String, versions)
    toml = parse_toml(path, fakeit=true)
    data = Dict{VersionNumber,Dict{String,Any}}()
    for ver in versions
        ver::VersionNumber
        for (v, d) in toml, (key, value) in d
            vr = VersionRange(v)
            ver in vr || continue
            dict = get!(data, ver, Dict{String,Any}())
            haskey(dict, key) && cmderror("$ver/$key is duplicated in $path")
            dict[key] = f(value)
        end
    end
    return data
end

load_package_data(f::Base.Callable, path::String, version::VersionNumber) =
    get(load_package_data(f, path, [version]), version, nothing)

function deps_graph(env::EnvCache, pkgs::Vector{PackageSpec})
    deps = Dict{UUID,Dict{VersionNumber,Tuple{SHA1,Dict{UUID,VersionSpec}}}}()
    uuids = [pkg.uuid for pkg in pkgs]
    seen = UUID[]
    while true
        unseen = setdiff(uuids, seen)
        isempty(unseen) && break
        for uuid in unseen
            push!(seen, uuid)
            deps[uuid] = valtype(deps)()
            for path in registered_paths(env, uuid)
                version_info = load_versions(path)
                versions = sort!(collect(keys(version_info)))
                dependencies = load_package_data(UUID, joinpath(path, "dependencies.toml"), versions)
                compatibility = load_package_data(VersionSpec, joinpath(path, "compatibility.toml"), versions)
                for (v, h) in version_info
                    d = get_or_make(Dict{String,UUID}, dependencies, v)
                    r = get_or_make(Dict{String,VersionSpec}, compatibility, v)
                    q = Dict(u => get_or_make(VersionSpec, r, p) for (p, u) in d)
                    # VERSION in get_or_make(VersionSpec, r, "julia") || continue
                    deps[uuid][v] = (h, q)
                    for (p, u) in d
                        u in uuids || push!(uuids, u)
                    end
                end
            end
        end
        find_registered!(env, uuids)
    end
    return deps
end

"Resolve a set of versions given package version specs"
function resolve_versions!(env::EnvCache, pkgs::Vector{PackageSpec})::Dict{UUID,VersionNumber}
    info("Resolving package versions")
    # anything not mentioned is fixed
    uuids = UUID[pkg.uuid for pkg in pkgs]
    uuid_to_name = Dict{String, String}()
    for (name::String, uuid::UUID) in env.project["deps"]
        uuid_to_name[string(uuid)] = name
        uuid in uuids && continue
        info = manifest_info(env, uuid)
        haskey(info, "version") || continue
        ver = VersionNumber(info["version"])
        push!(pkgs, PackageSpec(name, uuid, ver))
    end
    # construct data structures for resolver and call it
    reqs = Dict{String,Pkg2.Types.VersionSet}(string(pkg.uuid) => pkg.version for pkg in pkgs)
    deps = convert(Dict{String,Dict{VersionNumber,Pkg2.Types.Available}}, deps_graph(env, pkgs))
    for dep_uuid in keys(deps)
        info = manifest_info(env, UUID(dep_uuid))
        if info != nothing
            uuid_to_name[info["uuid"]] = info["name"]
        end
    end
    deps = Pkg2.Query.prune_dependencies(reqs, deps, uuid_to_name)
    vers = convert(Dict{UUID,VersionNumber}, Pkg2.Resolve.resolve(reqs, deps, uuid_to_name))
    find_registered!(env, collect(keys(vers)))
    # update vector of package versions
    for pkg in pkgs
        pkg.version = vers[pkg.uuid]
    end
    uuids = UUID[pkg.uuid for pkg in pkgs]
    for (uuid, ver) in vers
        uuid in uuids && continue
        name = registered_name(env, uuid)
        push!(pkgs, PackageSpec(name, uuid, ver))
    end
    return vers
end

"Find names, repos and hashes for each package UUID & version"
function version_data(env::EnvCache, pkgs::Vector{PackageSpec})
    names = Dict{UUID,String}()
    hashes = Dict{UUID,SHA1}()
    upstreams = Dict{UUID,Vector{String}}()
    for pkg in pkgs
        uuid = pkg.uuid
        ver = pkg.version::VersionNumber
        upstreams[uuid] = String[]
        for path in registered_paths(env, uuid)
            info = parse_toml(path, "package.toml")
            if haskey(names, uuid)
                names[uuid] == info["name"] ||
                    cmderror("$uuid: name mismatch between registries: ",
                             "$(names[uuid]) vs. $(info["name"])")
            else
                names[uuid] = info["name"]
            end
            repo = info["repo"]
            repo in upstreams[uuid] || push!(upstreams[uuid], repo)
            vers = load_versions(path)
            if haskey(vers, ver)
                h = vers[ver]
                if haskey(hashes, uuid)
                    h == hashes[uuid] ||
                        warn("$uuid: hash mismatch for version $ver!")
                else
                    hashes[uuid] = h
                end
            end
        end
        @assert haskey(hashes, uuid)
    end
    foreach(sort!, values(upstreams))
    return names, hashes, upstreams
end

const refspecs = ["+refs/*:refs/remotes/cache/*"]

function get_archive_url_for_version(url::String, version)
    if (m = match(r"https://github.com/(.*?)/(.*?).git", url)) != nothing
        return "https://github.com/$(m.captures[1])/$(m.captures[2])/archive/v$(version).tar.gz"
    end
    return nothing
end

function install(
    env::EnvCache,
    uuid::UUID,
    name::String,
    hash::SHA1,
    urls::Vector{String},
    version::Union{VersionNumber,Void} = nothing
)::Tuple{String,Bool}
    # returns path to version & if it's newly installed
    version_path = find_installed(uuid, hash)
    ispath(version_path) && return version_path, false
    http_download_successful = false
    env.preview[] && return version_path, true
    if !USE_LIBGIT2_FOR_ALL_DOWNLOADS && version != nothing
        for url in urls
            archive_url = get_archive_url_for_version(url, version)
            if archive_url != nothing
                path = joinpath(tempdir(), name * "_" * randstring(6) * ".tar.gz")
                url_success = true
                try
                    cmd = BinaryProvider.gen_download_cmd(archive_url, path);
                    run(cmd, (DevNull, DevNull, DevNull))
                catch e
                    e isa InterruptException && rethrow(e)
                    url_success = false
                end
                url_success || continue
                http_download_successful = true
                dir = joinpath(tempdir(), randstring(12))
                mkpath(dir)
                cmd = BinaryProvider.gen_unpack_cmd(path, dir);
                run(cmd, (DevNull, DevNull, DevNull))
                dirs = readdir(dir)
                # 7z on Win might create this spurious file
                filter!(x -> x != "pax_global_header", dirs)
                @assert length(dirs) == 1
                !isdir(version_path) && mkpath(version_path)
                mv(joinpath(dir, dirs[1]), version_path; remove_destination=true)
                Base.rm(path; force = true)
                break # object was found, we can stop
            end
        end
    end
    if !http_download_successful || USE_LIBGIT2_FOR_ALL_DOWNLOADS
        upstream_dir = joinpath(depots()[1], "upstream")
        ispath(upstream_dir) || mkpath(upstream_dir)
        repo_path = joinpath(upstream_dir, string(uuid))
        repo = ispath(repo_path) ? LibGit2.GitRepo(repo_path) : begin
            # info("Cloning [$uuid] $name")
            LibGit2.clone(urls[1], repo_path, isbare=true)
        end
        git_hash = LibGit2.GitHash(hash.bytes)
        for i = 2:length(urls)
            try LibGit2.GitObject(repo, git_hash)
                break # object was found, we can stop
            catch err
                err isa LibGit2.GitError && err.code == LibGit2.Error.ENOTFOUND || rethrow(err)
            end
            url = urls[i]
            LibGit2.fetch(repo, remoteurl=url, refspecs=refspecs)
        end
        tree = try
            LibGit2.GitObject(repo, git_hash)
        catch err
            err isa LibGit2.GitError && err.code == LibGit2.Error.ENOTFOUND || rethrow(err)
            error("$name: git object $(string(hash)) could not be found")
        end
        tree isa LibGit2.GitTree ||
            error("$name: git object $(string(hash)) should be a tree, not $(typeof(tree))")
        mkpath(version_path)
        opts = LibGit2.CheckoutOptions(
            checkout_strategy = LibGit2.Consts.CHECKOUT_FORCE,
            target_directory = Base.unsafe_convert(Cstring, version_path)
        )
        h = string(hash)[1:16]
        LibGit2.checkout_tree(repo, tree, options=opts)
    end
    return version_path, true
end

function update_manifest(env::EnvCache, uuid::UUID, name::String, hash::SHA1, version::VersionNumber)
    infos = get!(env.manifest, name, Dict{String,Any}[])
    info = nothing
    for i in infos
        UUID(i["uuid"]) == uuid || continue
        info = i
        break
    end
    if info == nothing
        info = Dict{String,Any}("uuid" => string(uuid))
        push!(infos, info)
    end
    info["version"] = string(version)
    info["hash-sha1"] = string(hash)
    delete!(info, "deps")
    for path in registered_paths(env, uuid)
        data = load_package_data(UUID, joinpath(path, "dependencies.toml"), version)
        data == nothing && continue
        info["deps"] = convert(Dict{String,String}, data)
        break
    end
    return info
end

function prune_manifest(env::EnvCache)
    keep = map(UUID, values(env.project["deps"]))
    while !isempty(keep)
        clean = true
        for (name, infos) in env.manifest, info in infos
            haskey(info, "uuid") && haskey(info, "deps") || continue
            UUID(info["uuid"]) ∈ keep || continue
            for dep::UUID in values(info["deps"])
                dep ∈ keep && continue
                push!(keep, dep)
                clean = false
            end
        end
        clean && break
    end
    if VERSION < v"0.7.0-DEV.1393"
        filter!(env.manifest) do _, infos
            filter!(infos) do info
                haskey(info, "uuid") && UUID(info["uuid"]) ∈ keep
            end
            !isempty(infos)
        end
    else
        filter!(env.manifest) do _infos # (_, info) doesn't parse on 0.6
            _, infos = _infos
            filter!(infos) do info
                haskey(info, "uuid") && UUID(info["uuid"]) ∈ keep
            end
            !isempty(infos)
        end
    end
end

function apply_versions(env::EnvCache, pkgs::Vector{PackageSpec})::Vector{UUID}
    names, hashes, urls = version_data(env, pkgs)
    # install & update manifest
    new_versions = UUID[]

    jobs = Channel(NUM_CONCURRENT_DOWNLOADS);
    results = Channel(NUM_CONCURRENT_DOWNLOADS);
    @schedule begin
        for pkg in pkgs
            put!(jobs, pkg)
        end
    end

    for i in 1:NUM_CONCURRENT_DOWNLOADS
        @schedule begin
            for pkg in jobs
                uuid = pkg.uuid
                version = pkg.version::VersionNumber
                name, hash = names[uuid], hashes[uuid]
                try
                    version_path, new = install(env, uuid, name, hash, urls[uuid], version)
                    put!(results, (pkg, version_path, version, hash, new))
                catch e
                    put!(results, e)
                end
            end
        end
    end

    textwidth = VERSION < v"0.7.0-DEV.1930" ? Base.strwidth : Base.textwidth
    max_name = maximum(textwidth(names[pkg.uuid]) for pkg in pkgs)

    for _ in 1:length(pkgs)
        r = take!(results)
        r isa Exception && cmderror("Error when installing packages:\n", sprint(Base.showerror, r))
        pkg, path, version, hash, new = r
        if new
            vstr = version != nothing ? "v$version" : "[$h]"
            new && info("Installed $(rpad(names[pkg.uuid] * " ", max_name + 2, "─")) $vstr")
        end
        uuid = pkg.uuid
        version = pkg.version::VersionNumber
        name, hash = names[uuid], hashes[uuid]
        update_manifest(env, uuid, name, hash, version)
        new && push!(new_versions, uuid)
    end
    prune_manifest(env)
    return new_versions
end

function dependency_order_uuids(env::EnvCache, uuids::Vector{UUID})::Dict{UUID,Int}
    order = Dict{UUID,Int}()
    seen = UUID[]
    k::Int = 0
    function visit(uuid::UUID)
        uuid in seen &&
            return warn("Dependency graph not a DAG, linearizing anyway")
        haskey(order, uuid) && return
        push!(seen, uuid)
        info = manifest_info(env, uuid)
        haskey(info, "deps") &&
            foreach(visit, values(info["deps"]))
        pop!(seen)
        order[uuid] = k += 1
    end
    visit(uuid::String) = visit(UUID(uuid))
    foreach(visit, uuids)
    return order
end

function build_versions(env::EnvCache, uuids::Vector{UUID})
    # collect builds for UUIDs with `deps/build.jl` files
    env.preview[] && (info("Skipping building in preview mode"); return)
    builds = Tuple{UUID,String,SHA1,String}[]
    for uuid in uuids
        info = manifest_info(env, uuid)
        name = info["name"]
        # TODO: handle development packages?
        haskey(info, "hash-sha1") || continue
        hash = SHA1(info["hash-sha1"])
        path = find_installed(uuid, hash)
        ispath(path) || error("Build path for $name does not exist: $path")
        build_file = joinpath(path, "deps", "build.jl")
        ispath(build_file) && push!(builds, (uuid, name, hash, build_file))
    end
    # toposort builds by dependencies
    order = dependency_order_uuids(env, map(first, builds))
    sort!(builds, by = build -> order[first(build)])
    # build each package verions in a child process
    withenv("JULIA_ENV" => env.project_file) do
        LOAD_PATH = filter(x -> x isa AbstractString, Base.LOAD_PATH)
        for (uuid, name, hash, build_file) in builds
            log_file = splitext(build_file)[1] * ".log"
            Base.info("Building $name [$(string(hash)[1:16])]...")
            Base.info(" → $log_file")
            code = """
                empty!(Base.LOAD_PATH)
                append!(Base.LOAD_PATH, $(repr(LOAD_PATH)))
                empty!(Base.LOAD_CACHE_PATH)
                append!(Base.LOAD_CACHE_PATH, $(repr(Base.LOAD_CACHE_PATH)))
                empty!(Base.DL_LOAD_PATH)
                append!(Base.DL_LOAD_PATH, $(repr(Base.DL_LOAD_PATH)))
                cd($(repr(dirname(build_file))))
                include($(repr(build_file)))
                """
            cmd = ```
                $(Base.julia_cmd()) -O0 --color=no --history-file=no
                --startup-file=$(Base.JLOptions().startupfile != 2 ? "yes" : "no")
                --compilecache=$((VERSION < v"0.7.0-DEV.1735" ? Base.JLOptions().use_compilecache :
                                  Base.JLOptions().use_compiled_modules) != 0 ? "yes" : "no")
                --eval $code
                ```
            open(log_file, "w") do log
                success(pipeline(cmd, stdout=log, stderr=log))
            end ? Base.rm(log_file, force=true) :
            warn("Error building `$name`; see log file for further info")
        end
    end
    return
end

function rm(env::EnvCache, pkgs::Vector{PackageSpec})
    drop = UUID[]
    # find manifest-mode drops
    for pkg in pkgs
        pkg.mode == :manifest || continue
        info = manifest_info(env, pkg.uuid)
        if info != nothing
            pkg.uuid in drop || push!(drop, pkg.uuid)
        else
            str = has_name(pkg) ? pkg.name : string(pkg.uuid)
            warn("`$str` not in manifest, ignoring")
        end
    end
    # drop reverse dependencies
    while !isempty(drop)
        clean = true
        for (name, infos) in env.manifest, info in infos
            haskey(info, "uuid") && haskey(info, "deps") || continue
            deps = map(UUID, values(info["deps"]))
            isempty(drop ∩ deps) && continue
            uuid = UUID(info["uuid"])
            uuid ∉ drop || continue
            push!(drop, uuid)
            clean = false
        end
        clean && break
    end
    # find project-mode drops
    for pkg in pkgs
        pkg.mode == :project || continue
        found = false
        for (name::String, uuid::UUID) in env.project["deps"]
            has_name(pkg) && pkg.name == name ||
            has_uuid(pkg) && pkg.uuid == uuid || continue
            !has_name(pkg) || pkg.name == name ||
                error("project file name mismatch for `$uuid`: $(pkg.name) ≠ $name")
            !has_uuid(pkg) || pkg.uuid == uuid ||
                error("project file UUID mismatch for `$name`: $(pkg.uuid) ≠ $uuid")
            uuid in drop || push!(drop, uuid)
            found = true
            break
        end
        found && continue
        str = has_name(pkg) ? pkg.name : string(pkg.uuid)
        warn("`$str` not in project, ignoring")
    end
    # delete drops from project
    n = length(env.project["deps"])
    if VERSION < v"0.7.0-DEV.1393"
        filter!(env.project["deps"]) do _, uuid
            UUID(uuid) ∉ drop
        end
    else
        filter!(env.project["deps"]) do _uuid # (_, uuid) doesn't parse on 0.6
            _, uuid = _uuid
            UUID(uuid) ∉ drop
        end
    end
    if length(env.project["deps"]) == n
        info("No changes")
        return
    end
    # only keep reachable manifest entires
    prune_manifest(env)
    # update project & manifest
    write_env(env)
end

function add(env::EnvCache, pkgs::Vector{PackageSpec})
    # copy added name/UUIDs into project
    for pkg in pkgs
        env.project["deps"][pkg.name] = string(pkg.uuid)
    end
    # if a package is in the project file and
    # the manifest version in the specified version set
    # then leave the package as is at the installed version
    for (name::String, uuid::UUID) in env.project["deps"]
        info = manifest_info(env, uuid)
        info != nothing && haskey(info, "version") || continue
        version = VersionNumber(info["version"])
        for pkg in pkgs
            pkg.uuid == uuid && version ∈ pkg.version || continue
            pkg.version = version
        end
    end
    # resolve & apply package versions
    resolve_versions!(env, pkgs)
    new = apply_versions(env, pkgs)
    write_env(env) # write env before building
    build_versions(env, new)
end

function up(env::EnvCache, pkgs::Vector{PackageSpec})
    # resolve upgrade levels to version specs
    for pkg in pkgs
        pkg.version isa UpgradeLevel || continue
        level = pkg.version
        info = manifest_info(env, pkg.uuid)
        ver = VersionNumber(info["version"])
        if level == UpgradeLevel(:fixed)
            pkg.version = VersionNumber(info["version"])
        else
            r = level == UpgradeLevel(:patch) ? VersionRange(ver.major, ver.minor) :
                level == UpgradeLevel(:minor) ? VersionRange(ver.major) :
                level == UpgradeLevel(:major) ? VersionRange() :
                    error("unexpected upgrade level: $level")
            pkg.version = VersionSpec(r)
        end
    end
    # resolve & apply package versions
    resolve_versions!(env, pkgs)
    new = apply_versions(env, pkgs)
    write_env(env) # write env before building
    build_versions(env, new)
end

function test(env::EnvCache, pkgs::Vector{PackageSpec}; coverage=false)
    # See if we can find the test files for all packages
    missing_runtests = String[]
    testfiles        = String[]
    version_paths    = String[]
    for pkg in pkgs
        info = manifest_info(env, pkg.uuid)
        haskey(info, "hash-sha1") || cmderror("Could not find hash-sha for package $(pkg.name)")
        version_path = find_installed(pkg.uuid, SHA1(info["hash-sha1"]))
        testfile = joinpath(version_path, "test", "runtests.jl")
        if !isfile(testfile)
            push!(missing_runtests, pkg.name)
        end
        push!(version_paths, version_path)
        push!(testfiles, testfile)
    end
    if !isempty(missing_runtests)
        cmderror(length(missing_runtests) == 1 ? "Package " : "Packages ",
                join(missing_runtests, ", "),
                " did not provide a `test/runtests.jl` file")
    end

    pkgs_errored = []
    for (pkg, testfile, version_path) in zip(pkgs, testfiles, version_paths)
        info("Testing $(pkg.name) located at $version_path")
        if env.preview[]
            info("In preview mode, skipping tests for $(pkg.name)")
            continue
        end
        # TODO, cd to test folder (need to be careful with getting the same EnvCache
        # as for this session in that case
        compilemod_opt, compilemod_val = VERSION < v"0.7.0-DEV.1735" ?
                ("compilecache" ,     Base.JLOptions().use_compilecache) :
                ("compiled-modules",  Base.JLOptions().use_compiled_modules)

        testcmd = `"import Pkg3; include(\"$testfile\")"`
        cmd = ```
            $(Base.julia_cmd())
            --code-coverage=$(coverage ? "user" : "none")
            --color=$(Base.have_color ? "yes" : "no")
            --$compilemod_opt=$(Bool(compilemod_val) ? "yes" : "no")
            --check-bounds=yes
            --startup-file=$(Base.JLOptions().startupfile != 2 ? "yes" : "no")
            $testfile
        ```
        try
            run(cmd)
            info("$(pkg.name) tests passed")
        catch err
            push!(pkgs_errored, pkg.name)
        end

    end

    if !isempty(pkgs_errored)
        cmderror(length(pkgs_errored) == 1 ? "Package " : "Packages ",
                 join(pkgs_errored, ", "),
                 " errored during testing")
    end
end
end # module

