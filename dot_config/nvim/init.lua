-- Load LazyVim configuration
require("config.lazy")

-- Load theme manager for persistent themes
local theme_manager = require("config.theme-manager")
theme_manager.setup_commands()
theme_manager.init()
