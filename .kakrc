set global lsp_config %{
    [language.lua.settings.Lua]
    diagnostics.severity = { unused-local = "Warning", undefined-global = "Error" }
    workspace.ignoreSubmodules = false
    diagnostics.disable = ["lowercase-global", "redefined-local"]
    diagnostics.globals = ["__DebugAdapter", "__Profiler", "global", "data", "mods", "log", "serpent", "table_size", "localised_print"]
    runtime.plugin = "/home/rai/dev/factorio/lua-plugin/plugin.lua"
    runtime.version = "Lua 5.2"
    telemetry.enable = false
    workspace.ignoreDir = [".vscode", "src/archive"]
    workspace.library = [
        "/home/rai/dev/factorio/1/data/base/prototypes/entity/assemblerpipes.lua",
        "/home/rai/dev/factorio/1/data/base/prototypes/entity/crash-site.lua",
        "/home/rai/dev/factorio/1/data/base/prototypes/entity/entities.lua",
        "/home/rai/dev/factorio/1/data/base/prototypes/entity/laser-sounds.lua",
        "/home/rai/dev/factorio/1/data/base/prototypes/entity/pipecovers.lua",
        "/home/rai/dev/factorio/1/data/base/prototypes/entity/remnants.lua",
        "/home/rai/dev/factorio/1/data/base/prototypes/entity/trains.lua",
        "/home/rai/dev/factorio/1/data/base/prototypes/entity/turrets.lua",
        "/home/rai/dev/factorio/1/data/base/prototypes/particles.lua",
        "/home/rai/dev/factorio/1/data/base/prototypes/tile/tiles.lua",
        "/home/rai/dev/factorio/1/data/core/lualib",
        "/home/rai/dev/factorio/1/data/core/prototypes",
        "/home/rai/dev/factorio/runtime-api.lua",
        "/home/rai/dev/projects/personal/flib",
    ]
    workspace.preloadFileSize = 10000
}
