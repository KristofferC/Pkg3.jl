function _precompile_()
    ccall(:jl_generating_output, Cint, ()) == 1 || return nothing
    precompile(Tuple{typeof(Pkg3.TOML.insertpair), Pkg3.TOML.Parser, Pkg3.TOML.Table, String, String, Int64})
    precompile(Tuple{typeof(Pkg3.Display.filter_manifest!), getfield(Pkg3.Display, Symbol("##13#14")){Base.Dict{AbstractString, Any}}, Base.Dict{AbstractString, Any}})
    precompile(Tuple{typeof(Pkg3.TOML.insertpair), Pkg3.TOML.Parser, Pkg3.TOML.Table, String, Array{String, 1}, Int64})
    precompile(Tuple{typeof(Pkg3.Types.read_project), Base.IOStream})
    precompile(Tuple{typeof(Pkg3.TOML.table2dict), Base.Nullable{Pkg3.TOML.Table}})
    precompile(Tuple{typeof(Pkg3.TOML.whitespace), Pkg3.TOML.Parser})
    precompile(Tuple{typeof(Pkg3.REPLMode.do_rm!), Pkg3.Types.EnvCache, Array{Tuple{Symbol, Vararg{Any, N} where N}, 1}})
    precompile(Tuple{typeof(Pkg3.Types.find_project), Void})
    precompile(Tuple{typeof(Pkg3.Types.registered_names), Pkg3.Types.EnvCache, Base.Random.UUID})
    precompile(Tuple{typeof(Pkg3.REPLMode.do_up!), Pkg3.Types.EnvCache, Array{Tuple{Symbol, Vararg{Any, N} where N}, 1}})
    precompile(Tuple{typeof(Pkg3.Operations.add), Pkg3.Types.EnvCache, Array{Pkg3.Types.PackageSpec, 1}})
    precompile(Tuple{typeof(Pkg3.Operations.slug), Array{UInt8, 1}, Int64})
    precompile(Tuple{typeof(Pkg3.Operations.deps_graph), Pkg3.Types.EnvCache, Array{Pkg3.Types.PackageSpec, 1}})
    precompile(Tuple{typeof(Pkg3.Operations.rm), Pkg3.Types.EnvCache, Array{Pkg3.Types.PackageSpec, 1}})
    precompile(Tuple{typeof(Pkg3.REPLMode.do_add!), Pkg3.Types.EnvCache, Array{Tuple{Symbol, Vararg{Any, N} where N}, 1}})
    precompile(Tuple{typeof(Pkg3.Display.manifest_diff), Base.Dict{AbstractString, Any}, Base.Dict{AbstractString, Any}})
    precompile(Tuple{typeof(Pkg3.Types.registries), String})
    precompile(Tuple{typeof(Pkg3.Display.print_manifest_diff), Pkg3.Types.EnvCache, Pkg3.Types.EnvCache})
    precompile(Tuple{typeof(Pkg3.REPLMode.create_mode), Base.REPL.LineEditREPL, Base.LineEdit.Prompt})
    precompile(Tuple{getfield(Pkg3.TOML, Symbol("#kw##print")), Array{Any, 1}, typeof(Pkg3.TOML.print), Base.IOStream, Base.Dict{AbstractString, Any}})
    precompile(Tuple{typeof(Pkg3.Types.registered_uuids), Pkg3.Types.EnvCache, String})
    precompile(Tuple{typeof(Pkg3.TOML.expect), Pkg3.TOML.Parser, Char})
    precompile(Tuple{typeof(Pkg3.Display.print_project_diff), Pkg3.Types.EnvCache, Pkg3.Types.EnvCache})
    precompile(Tuple{typeof(Pkg3.TOML.comment), Pkg3.TOML.Parser})
    precompile(Tuple{typeof(Pkg3.Types.:(≲)), Pkg3.Types.VersionBound{2}, Base.VersionNumber})
    precompile(Tuple{typeof(Pkg3.TOML.parse), Base.IOStream})
    precompile(Tuple{typeof(Pkg3.Types.registered_name), Pkg3.Types.EnvCache, Base.Random.UUID})
    precompile(Tuple{typeof(Pkg3.Operations.build_versions), Pkg3.Types.EnvCache, Array{Base.Random.UUID, 1}})
    precompile(Tuple{typeof(Pkg3.Operations.version_data), Pkg3.Types.EnvCache, Array{Pkg3.Types.PackageSpec, 1}})
    precompile(Tuple{typeof(Pkg3.TOML.value), Pkg3.TOML.Parser})
    precompile(Tuple{typeof(Pkg3.Types.registries)})
    precompile(Tuple{typeof(Pkg3.Operations.get_or_make), Type{Base.Dict{String, Pkg3.Types.VersionSpec}}, Base.Dict{Base.VersionNumber, Base.Dict{String, Any}}, Base.VersionNumber})
    precompile(Tuple{getfield(Pkg3.BinaryProvider, Symbol("##probe_cmd#30")), Bool, typeof(identity), Base.Cmd})
    precompile(Tuple{typeof(Pkg3.TOML.SOME), Pkg3.TOML.Table})
    precompile(Tuple{typeof(Pkg3.TOML.parse), Pkg3.TOML.Parser})
    precompile(Tuple{typeof(Pkg3.Types.registered_uuid), Pkg3.Types.EnvCache, String})
    precompile(Tuple{typeof(Pkg3.Types.parse_toml), String, String})
    precompile(Tuple{typeof(Pkg3.Types.:(≲)), Pkg3.Types.VersionBound{3}, Base.VersionNumber})
    precompile(Tuple{typeof(Pkg3.Types.ensure_resolved), Pkg3.Types.EnvCache, Array{Pkg3.Types.PackageSpec, 1}, Bool})
    precompile(Tuple{typeof(Pkg3.Types.write_env), Pkg3.Types.EnvCache})
    precompile(Tuple{typeof(Pkg3.Types.read_manifest), String})
    precompile(Tuple{typeof(Pkg3.TOML.SOME), Array{String, 1}})
    precompile(Tuple{typeof(Pkg3.Operations.get_or_make), Type{Base.Dict{String, Base.Random.UUID}}, Base.Dict{Base.VersionNumber, Base.Dict{String, Any}}, Base.VersionNumber})
    precompile(Tuple{typeof(Pkg3.TOML.literalstring), Pkg3.TOML.Parser, Int64})
    precompile(Tuple{typeof(Pkg3.Types.registry_resolve!), Pkg3.Types.EnvCache, Array{Pkg3.Types.PackageSpec, 1}})
    precompile(Tuple{typeof(Pkg3.TOML.keyvalues), Pkg3.TOML.Parser, Pkg3.TOML.Table})
    precompile(Tuple{typeof(Pkg3.Display.in_project), Base.Dict{AbstractString, Any}})
    precompile(Tuple{typeof(Pkg3.Types.manifest_resolve!), Pkg3.Types.EnvCache, Array{Pkg3.Types.PackageSpec, 1}})
    precompile(Tuple{typeof(Pkg3.Types.read_project), Base.AbstractIOBuffer{Array{UInt8, 1}}})
    precompile(Tuple{getfield(Pkg3.Types, Symbol("##find_registered!#42")), Bool, typeof(identity), Pkg3.Types.EnvCache, Array{String, 1}, Array{Base.Random.UUID, 1}})
    precompile(Tuple{typeof(Pkg3.Display.manifest_by_uuid), Base.Dict{AbstractString, Any}})
    precompile(Tuple{typeof(Pkg3.Types.find_named_env)})
    precompile(Tuple{typeof(Pkg3.Operations.find_installed), Base.Random.UUID, Pkg3.Types.SHA1})
    precompile(Tuple{typeof(Pkg3.Types.:(≲)), Base.VersionNumber, Pkg3.Types.VersionBound{2}})
    precompile(Tuple{typeof(Pkg3.TOML.printkey), Base.IOStream, Array{String, 1}})
    precompile(Tuple{typeof(Pkg3.TOML.nextpos), Pkg3.TOML.Parser})
    precompile(Tuple{getfield(Pkg3.Types, Symbol("##parse_toml#7")), Bool, typeof(identity), String, String})
    precompile(Tuple{typeof(Pkg3.Types.:(≲)), Base.VersionNumber, Pkg3.Types.VersionBound{3}})
    precompile(Tuple{typeof(Pkg3.Operations.install), Pkg3.Types.EnvCache, Base.Random.UUID, String, Pkg3.Types.SHA1, Array{String, 1}, Base.VersionNumber})
    precompile(Tuple{typeof(Pkg3.Operations.load_package_data), Type{Base.Random.UUID}, String, Array{Base.VersionNumber, 1}})
    precompile(Tuple{typeof(Pkg3.TOML.addtable), Pkg3.TOML.Parser, Pkg3.TOML.Table, Array{String, 1}, Pkg3.TOML.Table, Int64})
    precompile(Tuple{typeof(Pkg3.TOML.consume), Pkg3.TOML.Parser, Char})
    precompile(Tuple{typeof(Pkg3.TOML.newline), Pkg3.TOML.Parser})
    precompile(Tuple{typeof(Pkg3.Types.pathrepr), Pkg3.Types.EnvCache, String, String})
    precompile(Tuple{getfield(Pkg3.BinaryProvider, Symbol("##41#62")), String, String})
    precompile(Tuple{typeof(Pkg3.TOML.escape), Pkg3.TOML.Parser, Int64, Bool})
    precompile(Tuple{typeof(Pkg3.Operations.load_package_data), Type{Pkg3.Types.VersionSpec}, String, Array{Base.VersionNumber, 1}})
    precompile(Tuple{typeof(Pkg3.Operations.update_manifest), Pkg3.Types.EnvCache, Base.Random.UUID, String, Pkg3.Types.SHA1, Base.VersionNumber})
    precompile(Tuple{typeof(Pkg3.Display.status), Pkg3.Types.EnvCache, Symbol})
    precompile(Tuple{getfield(Pkg3.BinaryProvider, Symbol("##probe_platform_engines!#31")), Bool, typeof(identity)})
    precompile(Tuple{typeof(Pkg3.Types.find_local_env), String})
    precompile(Tuple{typeof(Pkg3.BinaryProvider.__init__)})
    precompile(Tuple{getfield(Pkg3.Types, Symbol("##git_file_stream#21")), Bool, typeof(identity), Base.LibGit2.GitRepo, String})
    precompile(Tuple{typeof(Pkg3.Types.registered_paths), Pkg3.Types.EnvCache, Base.Random.UUID})
    precompile(Tuple{getfield(Pkg3.BinaryProvider, Symbol("##32#53")), String, String})
    precompile(Tuple{typeof(Pkg3.Operations.slug), UInt32, Int64})
    precompile(Tuple{typeof(Pkg3.TOML.keyname), Pkg3.TOML.Parser})
    precompile(Tuple{typeof(Pkg3.TOML.addarray), Pkg3.TOML.Parser, Pkg3.TOML.Table, Array{String, 1}, Pkg3.TOML.Table, Int64})
    precompile(Tuple{typeof(Pkg3.REPLMode.do_cmd), Base.REPL.LineEditREPL, String})
    precompile(Tuple{getfield(Pkg3.TOML, Symbol("##printvalue#3")), Bool, typeof(identity), Base.IOStream, String})
    precompile(Tuple{typeof(Pkg3.TOML.ignore), Pkg3.TOML.Parser})
    precompile(Tuple{typeof(Pkg3.Operations.resolve_versions!), Pkg3.Types.EnvCache, Array{Pkg3.Types.PackageSpec, 1}})
    precompile(Tuple{typeof(Pkg3.Operations.get_or_make), Type{Pkg3.Types.VersionSpec}, Base.Dict{String, Pkg3.Types.VersionSpec}, String})
    precompile(Tuple{getfield(Pkg3.Types, Symbol("#kw##parse_toml")), Array{Any, 1}, typeof(Pkg3.Types.parse_toml), String, String})
    precompile(Tuple{typeof(Pkg3.TOML.basicstring), Pkg3.TOML.Parser, Int64, Bool})
    precompile(Tuple{typeof(Pkg3.Operations.load_versions), String})
    precompile(Tuple{getfield(Pkg3.Types, Symbol("##13#18")), Base.Pair{String, Base.Random.UUID}})
    precompile(Tuple{typeof(Pkg3.Display.vstring), Pkg3.Display.VerInfo})
    precompile(Tuple{typeof(Pkg3.TOML.basicstring), Pkg3.TOML.Parser, Int64})
    precompile(Tuple{typeof(Pkg3.__init__)})
    precompile(Tuple{typeof(Pkg3.Types.manifest_info), Pkg3.Types.EnvCache, Base.Random.UUID})
    precompile(Tuple{typeof(Pkg3.Display.name_ver_info), Base.Dict{String, Any}})
    precompile(Tuple{getfield(Pkg3.TOML, Symbol("#kw##printvalue")), Array{Any, 1}, typeof(Pkg3.TOML.printvalue), Base.IOStream, Array{String, 1}})
    precompile(Tuple{typeof(Pkg3.TOML.parse), Base.DevNullStream})
    precompile(Tuple{getfield(Pkg3.TOML, Symbol("#kw##printvalue")), Array{Any, 1}, typeof(Pkg3.TOML.printvalue), Base.IOStream, String})
    precompile(Tuple{typeof(Pkg3.TOML.parse), Base.AbstractIOBuffer{Array{UInt8, 1}}})
    precompile(Tuple{typeof(Pkg3.Display.:(≈)), Pkg3.Display.VerInfo, Pkg3.Display.VerInfo})
    precompile(Tuple{typeof(Pkg3.Operations.up), Pkg3.Types.EnvCache, Array{Pkg3.Types.PackageSpec, 1}})
    precompile(Tuple{getfield(Pkg3.Types, Symbol("#kw##git_file_stream")), Array{Any, 1}, typeof(Pkg3.Types.git_file_stream), Base.LibGit2.GitRepo, String})
    precompile(Tuple{typeof(Pkg3.TOML.boolean), Pkg3.TOML.Parser, Int64})
    precompile(Tuple{typeof(Pkg3.Types.read_manifest), Base.DevNullStream})
    precompile(Tuple{typeof(Pkg3.Types.find_registered!), Pkg3.Types.EnvCache, Array{Base.Random.UUID, 1}})
    precompile(Tuple{typeof(Pkg3.TOML.separator), Pkg3.TOML.Parser})
    precompile(Tuple{typeof(Pkg3.TOML.inlinetable), Pkg3.TOML.Parser, Int64})
    precompile(Tuple{typeof(Pkg3.Types.find_registered!), Pkg3.Types.EnvCache, Array{String, 1}, Array{Base.Random.UUID, 1}})
    precompile(Tuple{typeof(Pkg3.REPLMode.do_status!), Pkg3.Types.EnvCache, Array{Tuple{Symbol, Vararg{Any, N} where N}, 1}})
    precompile(Tuple{getfield(Pkg3.Types, Symbol("#kw##find_registered!")), Array{Any, 1}, typeof(Pkg3.Types.find_registered!), Pkg3.Types.EnvCache, Array{String, 1}, Array{Base.Random.UUID, 1}})
    precompile(Tuple{typeof(Pkg3.REPLMode.do_help!), Pkg3.Types.EnvCache, Array{Tuple{Symbol, Vararg{Any, N} where N}, 1}, Base.REPL.LineEditREPL})
    precompile(Tuple{getfield(Pkg3.Types, Symbol("##46#52")), Base.AbstractIOBuffer{Array{UInt8, 1}}})
    precompile(Tuple{typeof(Pkg3.Operations.dependency_order_uuids), Pkg3.Types.EnvCache, Array{Base.Random.UUID, 1}})
    precompile(Tuple{typeof(Pkg3.Display.filter_manifest!), getfield(Base, Symbol("##57#58")){getfield(Pkg3.Display, Symbol("##13#14")){Base.Dict{AbstractString, Any}}}, Base.Dict{AbstractString, Any}})
    precompile(Tuple{getfield(Pkg3.TOML, Symbol("##printvalue#3")), Bool, typeof(identity), Base.IOStream, Array{String, 1}})
    precompile(Tuple{typeof(Pkg3.TerminalMenus.__init__)})
    precompile(Tuple{typeof(Pkg3.TOML.array), Pkg3.TOML.Parser, Int64})
    precompile(Tuple{typeof(Pkg3.REPLMode.repl_init), Base.REPL.LineEditREPL})
    precompile(Tuple{getfield(Pkg3.TOML, Symbol("#kw##_print")), Array{Any, 1}, typeof(Pkg3.TOML._print), Base.IOStream, Base.Dict{String, Any}, Array{String, 1}})
    precompile(Tuple{getfield(Pkg3.TOML, Symbol("##_print#4")), Bool, typeof(identity), Base.IOStream, Base.Dict{AbstractString, Any}, Array{String, 1}})
    precompile(Tuple{typeof(Pkg3.Types.registered_info), Pkg3.Types.EnvCache, Base.Random.UUID, String})
    precompile(Tuple{typeof(Pkg3.TOML.peek), Pkg3.TOML.Parser})
    precompile(Tuple{typeof(Pkg3.TOML.literalstring), Pkg3.TOML.Parser, Int64, Bool})
    precompile(Tuple{getfield(Pkg3.Types, Symbol("##22#23")), Base.Pair{AbstractString, Any}})
    precompile(Tuple{getfield(Pkg3.Operations, Symbol("##9#11")), Base.Pair{String, Base.Random.UUID}})
    precompile(Tuple{getfield(Pkg3.Types, Symbol("##45#51")), Base.AbstractIOBuffer{Array{UInt8, 1}}})
    precompile(Tuple{getfield(Pkg3.Display, Symbol("##5#6")), Pkg3.Display.DiffEntry})
    precompile(Tuple{typeof(Pkg3.TOML.numdatetime), Pkg3.TOML.Parser, Int64})
    precompile(Tuple{typeof(Pkg3.TOML.datetime), Pkg3.TOML.Parser, String, Int64})
    precompile(Tuple{typeof(Pkg3.Types.find_git_repo), String})
    precompile(Tuple{typeof(Pkg3.Types.read_project), Base.DevNullStream})
    precompile(Tuple{getfield(Pkg3.Operations, Symbol("##6#7")), Base.Pair{AbstractString, Any}})
    precompile(Tuple{typeof(Pkg3.Operations.get_archive_url_for_version), String, Base.VersionNumber})
    precompile(Tuple{getfield(Pkg3.Types, Symbol("##git_discover#20")), String, Bool, typeof(identity), String})
    precompile(Tuple{typeof(Pkg3.TOML.table2dict), Pkg3.TOML.Table})
    precompile(Tuple{getfield(Pkg3.Operations, Symbol("##13#16")), Pkg3.Types.PackageSpec})
    precompile(Tuple{getfield(Pkg3.Display, Symbol("##7#8")), Pkg3.Display.DiffEntry})
    precompile(Tuple{getfield(Pkg3.BinaryProvider, Symbol("#kw##probe_cmd")), Array{Any, 1}, typeof(Pkg3.BinaryProvider.probe_cmd), Base.Cmd})
    precompile(Tuple{getfield(Pkg3.Types, Symbol("#kw##git_discover")), Array{Any, 1}, typeof(Pkg3.Types.git_discover), String})
    precompile(Tuple{getfield(Pkg3.Display, Symbol("##3#4")), Pkg3.Display.DiffEntry})
    precompile(Tuple{typeof(Pkg3.Operations.apply_versions), Pkg3.Types.EnvCache, Array{Pkg3.Types.PackageSpec, 1}})
    precompile(Tuple{typeof(Pkg3.Types.read_manifest), Base.IOStream})
    precompile(Tuple{typeof(Pkg3.Operations.load_package_data), Type{Base.Random.UUID}, String, Base.VersionNumber})
    precompile(Tuple{typeof(Pkg3.TOML.rewind), Pkg3.TOML.Parser, Int64})
    precompile(Tuple{getfield(Pkg3.TOML, Symbol("#parsetwodigits#2")), Pkg3.TOML.Parser, Bool})
    precompile(Tuple{typeof(Pkg3.Types.read_manifest), Base.AbstractIOBuffer{Array{UInt8, 1}}})
    precompile(Tuple{getfield(Pkg3.TOML, Symbol("#kw##_print")), Array{Any, 1}, typeof(Pkg3.TOML._print), Base.IOStream, Base.Dict{AbstractString, Any}, Array{String, 1}})
    precompile(Tuple{getfield(Pkg3.TOML, Symbol("##_print#4")), Bool, typeof(identity), Base.IOStream, Base.Dict{String, Any}, Array{String, 1}})
    precompile(Tuple{typeof(Pkg3.Display.print_diff), Base.TTY, Array{Pkg3.Display.DiffEntry, 1}})
    precompile(Tuple{typeof(Pkg3.Types.project_resolve!), Pkg3.Types.EnvCache, Array{Pkg3.Types.PackageSpec, 1}})
    precompile(Tuple{typeof(Pkg3.TOML.integer), Pkg3.TOML.Parser, Int64, Bool, Bool})
    precompile(Tuple{typeof(Pkg3.REPLMode.tokenize), String})
    precompile(Tuple{getfield(Pkg3.Display, Symbol("##1#2")), Pkg3.Display.DiffEntry})
    precompile(Tuple{typeof(Pkg3.Operations.prune_manifest), Pkg3.Types.EnvCache})
    precompile(Tuple{typeof(Pkg3.TOML.nested), Pkg3.TOML.Parser, Pkg3.TOML.Table, Array{String, 1}, Int64})
    precompile(Tuple{typeof(Pkg3.TOML.isbare), Char})
    precompile(Tuple{Type{Base.Dict{K, V} where V where K}, Base.Dict{String, Base.Pkg.Types.VersionSet}})
    precompile(Tuple{Type{Base.Dict{K, V} where V where K}, Base.Generator{Base.Dict{String, Base.Random.UUID}, getfield(Pkg3.Operations, Symbol("##9#11"))}})
    precompile(Tuple{Type{Base.Dict{String, Int64}}, Base.Generator{Base.UnitRange{Int64}, getfield(Base.Pkg.Resolve.PkgToMaxSumInterface, Symbol("##1#4")){Array{String, 1}}}})
    precompile(Tuple{Type{Base.Dict{K, V} where V where K}, Base.Generator{Base.Dict{AbstractString, Any}, getfield(Pkg3.Operations, Symbol("##6#7"))}})
    precompile(Tuple{Type{Base.Dict{K, V} where V where K}, Base.Generator{Base.Dict{AbstractString, Any}, getfield(Pkg3.Types, Symbol("##22#23"))}})
    precompile(Tuple{Type{Base.LibGit2.GitBlob}, Base.LibGit2.GitRepo, String})
    precompile(Tuple{Type{Base.Dict{K, V} where V where K}, Base.Generator{Array{String, 1}, getfield(Pkg3.Types, Symbol("##8#9")){Base.Dict{AbstractString, Any}}}})
    precompile(Tuple{Type{Base.LibGit2.GitRepo}, String})
    precompile(Tuple{Type{Base.Dict{String, Bool}}, Base.Iterators.Flatten{Base.Generator{Base.ValueIterator{Base.Dict{Base.VersionNumber, Base.Pkg.Types.Available}}, getfield(Base.Pkg.Query, Symbol("##16#22"))}}})
    precompile(Tuple{getfield(Pkg3.Types, Symbol("##3#4")){Base.VersionNumber}, Pkg3.Types.VersionRange{2, 2}})
    precompile(Tuple{Type{Pkg3.Types.EnvCache}, Void})
    precompile(Tuple{Type{Base.Pkg.Types.VersionSet}, Pkg3.Types.VersionRange{2, 2}})
    precompile(Tuple{Type{Base.Pkg.Types.VersionSet}, Pkg3.Types.VersionRange{3, 2}})
    precompile(Tuple{Type{Pkg3.Types.VersionRange{m, n} where n where m}, String})
    precompile(Tuple{Type{Base.Dict{K, V} where V where K}, Base.Pair{String, String}})
    precompile(Tuple{Type{Base.Dict{Base.VersionNumber, Pkg3.Types.SHA1}}, Base.Generator{Base.Dict{AbstractString, Any}, getfield(Pkg3.Operations, Symbol("##6#7"))}})
    precompile(Tuple{Type{Base.Random.UUID}, Base.SubString{String}})
    precompile(Tuple{Type{Pkg3.Types.VersionBound{n} where n}, Int64, Int64, Int64})
    precompile(Tuple{getfield(Pkg3.REPLMode, Symbol("##3#4")){Base.REPL.LineEditREPL, Base.LineEdit.Prompt}, Base.LineEdit.MIState, Base.AbstractIOBuffer{Array{UInt8, 1}}, Bool})
    precompile(Tuple{Type{Base.Dict{K, V} where V where K}, Base.Generator{Array{AbstractString, 1}, getfield(Pkg3.Types, Symbol("##12#17"))}})
    precompile(Tuple{Type{Pkg3.Types.SHA1}, String})
    precompile(Tuple{getfield(Pkg3.Operations, Symbol("##24#27")){Array{Pkg3.Types.PackageSpec, 1}, Base.Channel{Any}}})
    precompile(Tuple{getfield(Pkg3.Types, Symbol("##61#62")){Pkg3.Types.EnvCache}, Base.Random.UUID})
    precompile(Tuple{Type{Base.Dict{Base.VersionNumber, Bool}}, Base.Generator{Base.KeyIterator{Base.Dict{Base.VersionNumber, Base.Pkg.Types.Available}}, getfield(Base.Pkg.Query, Symbol("##13#19"))}})
    precompile(Tuple{getfield(Pkg3.Operations, Symbol("#visit#30")){Pkg3.Types.EnvCache, Base.Dict{Base.Random.UUID, Int64}, Array{Base.Random.UUID, 1}}, Base.Random.UUID})
    precompile(Tuple{Type{Base.Pair{A, B} where B where A}, String, Base.VersionNumber})
    precompile(Tuple{Type{Base.Iterators.Enumerate{I} where I}, Array{Base.Random.UUID, 1}})
    precompile(Tuple{Type{Array{Base.Pkg.Resolve.VersionWeights.VersionWeight, 1}}, Int64})
    precompile(Tuple{Type{Base.Pair{A, B} where B where A}, String, Pkg3.Types.VersionSpec})
    precompile(Tuple{Type{Base.Generator{I, F} where F where I}, getfield(Base.Pkg.Query, Symbol("##14#20")), Base.Iterators.Filter{getfield(Base.Pkg.Query, Symbol("##15#21")), Base.KeyIterator{Base.Dict{Base.VersionNumber, Base.Pkg.Types.Available}}}})
    precompile(Tuple{(getfield(Base.REPL, Symbol("##27#37"))){Base.LineEdit.Prompt}, Base.LineEdit.MIState, Base.REPL.LineEditREPL, Int})
    precompile(Tuple{(getfield(Pkg3.REPLMode, Symbol("##5#7"))){Base.LineEdit.Prompt}, Base.LineEdit.MIState, Base.REPL.LineEditREPL, Int})
    precompile(Tuple{Type{Base.Generator{I, F} where F where I}, getfield(Pkg3.Types, Symbol("##8#9")){Base.Dict{AbstractString, Any}}, Array{String, 1}})
    precompile(Tuple{(getfield(Base.REPL, Symbol("##17#20"))){Base.LineEdit.Prompt}, Base.LineEdit.MIState, Base.REPL.LineEditREPL, Int})
    precompile(Tuple{Type{Pkg3.Types.VersionBound{n} where n}, Base.SubString{String}})
    precompile(Tuple{Type{Base.Pkg.Resolve.MaxSum.Messages}, Base.Pkg.Resolve.PkgToMaxSumInterface.Interface, Base.Pkg.Resolve.MaxSum.Graph})
    precompile(Tuple{Type{Base.Iterators.Filter{F, I} where I where F}, getfield(Base.Pkg.Query, Symbol("##15#21")), Base.KeyIterator{Base.Dict{Base.VersionNumber, Base.Pkg.Types.Available}}})
    precompile(Tuple{Type{Base.Pair{A, B} where B where A}, Base.VersionNumber, Base.Pkg.Types.Available})
    precompile(Tuple{Type{Base.Pair{A, B} where B where A}, Base.Random.UUID, Pkg3.Types.VersionSpec})
    precompile(Tuple{Type{Base.Generator{I, F} where F where I}, getfield(Base.Pkg.Query, Symbol("##13#19")), Base.KeyIterator{Base.Dict{Base.VersionNumber, Base.Pkg.Types.Available}}})
    precompile(Tuple{Type{Base.Pkg.Types.VersionSet}, Array{Base.VersionNumber, 1}})
    precompile(Tuple{Type{Base.Generator{I, F} where F where I}, getfield(Pkg3.Types, Symbol("##22#23")), Base.Dict{AbstractString, Any}})
    precompile(Tuple{Type{Pkg3.Display.VerInfo}, Pkg3.Types.SHA1, Base.VersionNumber})
    precompile(Tuple{getfield(Pkg3.Operations, Symbol("##32#36")){Array{Tuple{Base.Random.UUID, String, Pkg3.Types.SHA1, String}, 1}}})
    precompile(Tuple{Type{Base.Generator{I, F} where F where I}, typeof(Pkg3.TOML.table2dict), Array{Any, 1}})
    precompile(Tuple{Type{Array{Array{Base.Pkg.Resolve.VersionWeights.VersionWeight, 1}, 1}}, Int64})
    precompile(Tuple{Type{Pkg3.Types.VersionRange{m, n} where n where m}, Pkg3.Types.VersionBound{2}, Pkg3.Types.VersionBound{2}})
    precompile(Tuple{Type{Base.Generator{I, F} where F where I}, getfield(Pkg3.Types, Symbol("##12#17")), Array{AbstractString, 1}})
    precompile(Tuple{Type{Base.Pkg.Resolve.MaxSum.Graph}, Base.Pkg.Resolve.PkgToMaxSumInterface.Interface})
    precompile(Tuple{Type{Pkg3.Types.VersionBound{n} where n}, Int64, Int64})
    precompile(Tuple{Type{Pkg3.Display.DiffEntry}, Base.Random.UUID, String, Pkg3.Display.VerInfo, Pkg3.Display.VerInfo})
    precompile(Tuple{Type{Base.Generator{I, F} where F where I}, getfield(Base.Pkg.Resolve.PkgToMaxSumInterface, Symbol("##1#4")){Array{String, 1}}, Base.UnitRange{Int64}})
    precompile(Tuple{Type{Base.Pkg.Types.VersionSet}, Pkg3.Types.VersionRange{0, 0}})
    precompile(Tuple{Type{Pkg3.Display.DiffEntry}, Base.Random.UUID, String, Void, Pkg3.Display.VerInfo})
    precompile(Tuple{Type{Base.Generator{I, F} where F where I}, getfield(Base.Pkg.Resolve.PkgToMaxSumInterface, Symbol("##3#6")), Base.UnitRange{Int64}})
    precompile(Tuple{Type{Pkg3.Types.VersionRange{m, n} where n where m}, Pkg3.Types.VersionBound{3}, Pkg3.Types.VersionBound{2}})
    precompile(Tuple{Type{Base.Generator{I, F} where F where I}, Type{Base.Random.UUID}, Base.ValueIterator{Base.Dict{AbstractString, Any}}})
    precompile(Tuple{Type{Base.Generator{I, F} where F where I}, getfield(Pkg3.Operations, Symbol("##6#7")), Base.Dict{AbstractString, Any}})
    precompile(Tuple{Type{Pkg3.Types.VersionRange{m, n} where n where m}, Pkg3.Types.VersionBound{2}, Pkg3.Types.VersionBound{3}})
    precompile(Tuple{Type{Base.Pkg.Resolve.VersionWeights.VersionWeight}, Base.VersionNumber})
    precompile(Tuple{Type{Base.Generator{I, F} where F where I}, getfield(Base.Pkg.Resolve.PkgToMaxSumInterface, Symbol("##2#5")), Base.UnitRange{Int64}})
    precompile(Tuple{getfield(Pkg3.Types, Symbol("#save#50")){Pkg3.Types.EnvCache}, String})
    precompile(Tuple{Type{Pkg3.Types.VersionRange{m, n} where n where m}, Pkg3.Types.VersionBound{3}, Pkg3.Types.VersionBound{3}})
    precompile(Tuple{getfield(Pkg3.Types, Symbol("##47#53")){Pkg3.Types.EnvCache}, Base.IOStream})
    precompile(Tuple{Type{Base.Pair{A, B} where B where A}, String, Base.Random.UUID})
    precompile(Tuple{Type{Base.Random.UUID}, String})
    precompile(Tuple{Type{Pkg3.Types.VersionBound{0}}, Tuple{}})
    precompile(Tuple{Type{Pkg3.Types.SHA1}, Array{UInt8, 1}})
    precompile(Tuple{Type{Core.Inference.InvokeData}, MethodTable, TypeMapEntry, Int, Int, Int})
    precompile(Tuple{Type{Pkg3.Types.VersionBound{3}}, Tuple{Int64, Int64, Int64}})
    precompile(Tuple{Type{Base.Dict{String, Base.Pkg.Types.VersionSet}}, Base.Generator{Array{Pkg3.Types.PackageSpec, 1}, getfield(Pkg3.Operations, Symbol("##13#16"))}})
    precompile(Tuple{getfield(Base.LineEdit, Symbol("##13#14")){getfield(Base.REPL, Symbol("##17#20")){Base.LineEdit.Prompt}, String}, Base.LineEdit.MIState, Base.REPL.LineEditREPL})
    precompile(Tuple{getfield(Base.LineEdit, Symbol("##13#14")){getfield(Pkg3.REPLMode, Symbol("##5#7")){Base.LineEdit.Prompt}, String}, Base.LineEdit.MIState, Base.REPL.LineEditREPL})
    precompile(Tuple{getfield(Base.LineEdit, Symbol("##13#14")){getfield(Base.LineEdit, Symbol("##92#122")), String}, Base.LineEdit.MIState, Void})
    precompile(Tuple{Type{Base.LineEdit.Prompt}, String, String, String, Base.Dict{Char, Any}, Void, Base.LineEdit.EmptyCompletionProvider, typeof(identity), typeof(identity), Base.LineEdit.EmptyHistoryProvider, Bool})
    precompile(Tuple{getfield(Base.Pkg.Types, Symbol("##1#2")){Base.VersionNumber}, Base.Pkg.Types.VersionInterval})
    precompile(Tuple{getfield(Base.LineEdit, Symbol("##13#14")){getfield(Base.REPL, Symbol("##17#20")){Base.LineEdit.Prompt}, String}, Base.LineEdit.MIState, Void})
    precompile(Tuple{Type{Pkg3.Types.VersionSpec}, String})
    precompile(Tuple{Type{Base.Dict{Base.VersionNumber, Base.Pkg.Types.Available}}, Base.Generator{Base.Iterators.Filter{getfield(Base.Pkg.Query, Symbol("##15#21")), Base.KeyIterator{Base.Dict{Base.VersionNumber, Base.Pkg.Types.Available}}}, getfield(Base.Pkg.Query, Symbol("##14#20"))}})
    precompile(Tuple{getfield(Base.LineEdit, Symbol("##13#14")){getfield(Base.LineEdit, Symbol("##101#131")), String}, Base.LineEdit.MIState, Void})
    precompile(Tuple{getfield(Pkg3.Display, Symbol("##13#14")){Base.Dict{AbstractString, Any}}, String, Base.Dict{AbstractString, Any}})
    precompile(Tuple{getfield(Pkg3.Display, Symbol("##13#14")){Base.Dict{AbstractString, Any}}, String, Base.Dict{String, Any}})
    precompile(Tuple{Type{Pkg3.Display.DiffEntry}, Base.Random.UUID, String, Pkg3.Display.VerInfo, Void})
    precompile(Tuple{getfield(Pkg3.Operations, Symbol("##1#2")){Int64}, Base.AbstractIOBuffer{Array{UInt8, 1}}})
    precompile(Tuple{Type{Base.BitArray{2}}, Int64, Int64})
    precompile(Tuple{Type{Pkg3.Types.VersionBound{1}}, Tuple{Int64}})
    precompile(Tuple{Type{Base.LibGit2.GitBlob}, Base.LibGit2.GitRepo, Ptr{Void}, Bool})
    precompile(Tuple{(getfield(Base.REPL, Symbol("##17#20"))){Base.LineEdit.Prompt}, Base.LineEdit.MIState, Void, Int})
    precompile(Tuple{Type{Base.Dict{String, String}}, Tuple{Base.Pair{String, String}}})
    precompile(Tuple{Type{Base.Pkg.Resolve.MaxSum.MaxSumParams}})
    precompile(Tuple{getfield(Pkg3.Operations, Symbol("##26#29")){Base.Dict{Base.Random.UUID, String}}, Pkg3.Types.PackageSpec})
    precompile(Tuple{getfield(Base.LineEdit, Symbol("##13#14")){getfield(Base.REPL, Symbol("##27#37")){Base.LineEdit.Prompt}, String}, Base.LineEdit.MIState, Base.REPL.LineEditREPL})
    precompile(Tuple{getfield(Pkg3.Operations, Symbol("##25#28")){Pkg3.Types.EnvCache, Base.Dict{Base.Random.UUID, String}, Base.Dict{Base.Random.UUID, Pkg3.Types.SHA1}, Base.Dict{Base.Random.UUID, Array{String, 1}}, Base.Channel{Any}, Base.Channel{Any}}})
    precompile(Tuple{getfield(Pkg3.Operations, Symbol("##21#23")){Array{Base.Random.UUID, 1}}, Base.Dict{AbstractString, Any}})
    precompile(Tuple{getfield(Pkg3.Operations, Symbol("##21#23")){Array{Base.Random.UUID, 1}}, Base.Dict{String, Any}})
    precompile(Tuple{getfield(Pkg3.Types, Symbol("##8#9")){Base.Dict{AbstractString, Any}}, String})
    precompile(Tuple{getfield(Base.REPL, Symbol("#do_respond#16")){Bool, getfield(Base.REPL, Symbol("##26#36")){Base.REPL.LineEditREPL, Base.REPL.REPLHistoryProvider}, Base.REPL.LineEditREPL, Base.LineEdit.Prompt}, Base.LineEdit.MIState, Base.AbstractIOBuffer{Array{UInt8, 1}}, Bool})
    precompile(Tuple{Type{Pkg3.Types.PackageSpec}, String})
    precompile(Tuple{getfield(Pkg3.Types, Symbol("#save#50")){Pkg3.Types.EnvCache}, Base.Random.UUID})
    precompile(Tuple{Type{Base.LibGit2.GitRepo}, Ptr{Void}, Bool})
    precompile(Tuple{Type{Base.Pkg.Resolve.PkgToMaxSumInterface.Interface}, Base.Dict{String, Base.Pkg.Types.VersionSet}, Base.Dict{String, Base.Dict{Base.VersionNumber, Base.Pkg.Types.Available}}})
    precompile(Tuple{getfield(Pkg3.Types, Symbol("##55#58")){Base.Random.UUID}, Base.Pair{String, Array{Base.Random.UUID, 1}}})
    precompile(Tuple{getfield(Base.Pkg.Resolve.MaxSum, Symbol("#noise#13")){Array{String, 1}, Array{Int64, 1}, Array{Array{Base.VersionNumber, 1}, 1}}, Int64, Int64})
    precompile(Tuple{Type{Pkg3.Types.VersionBound{2}}, Tuple{Int64, Int64}})
    precompile(Tuple{Type{Base.Dict{String, Base.Pkg.Types.VersionSet}}, Base.Dict{String, Base.Pkg.Types.VersionSet}})
end