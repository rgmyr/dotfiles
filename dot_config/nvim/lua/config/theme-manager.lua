-- Theme Manager for persistent theme selection
local M = {}

-- Theme state file
local theme_state_file = vim.fn.stdpath("data") .. "/theme_state.txt"

-- Available themes
local themes = {
  tokyonight = "tokyonight",
  catppuccin = "catppuccin", 
  rose_pine = "rose-pine",
  gruvbox = "gruvbox",
  solarized = "solarized",
  github_dark_dimmed = "github_dark_dimmed"
}

-- Save current theme to state file
function M.save_theme(theme_name)
  if theme_name and themes[theme_name] then
    local file = io.open(theme_state_file, "w")
    if file then
      file:write(theme_name)
      file:close()
      return true
    end
  end
  return false
end

-- Load saved theme from state file
function M.load_saved_theme()
  local file = io.open(theme_state_file, "r")
  if file then
    local theme = file:read("*line")
    file:close()
    if theme and themes[theme] then
      return theme
    end
  end
  return nil
end

-- Set theme and save preference
function M.set_theme(theme_name)
  if not theme_name or not themes[theme_name] then
    vim.notify("Invalid theme: " .. (theme_name or "nil"), vim.log.levels.ERROR)
    return false
  end
  
  -- Set the theme
  local success, _ = pcall(vim.cmd.colorscheme, themes[theme_name])
  if success then
    -- Save theme preference
    M.save_theme(theme_name)
    
    -- Set background appropriately
    if theme_name == "solarized" then
      vim.cmd("set background=light")
    else
      vim.cmd("set background=dark")
    end
    
    vim.notify("Theme set to: " .. theme_name, vim.log.levels.INFO)
    return true
  else
    vim.notify("Failed to set theme: " .. theme_name, vim.log.levels.ERROR)
    return false
  end
end

-- Initialize theme on startup
function M.init()
  -- Try to load saved theme
  local saved_theme = M.load_saved_theme()
  if saved_theme then
    -- Small delay to ensure plugins are loaded
    vim.defer_fn(function()
      M.set_theme(saved_theme)
    end, 100)
  else
    -- Fall back to default theme (GitHub Dark Dimmed)
    vim.defer_fn(function()
      M.set_theme("github_dark_dimmed")
    end, 100)
  end
end

-- Create theme switching commands
function M.setup_commands()
  vim.api.nvim_create_user_command("Theme", function(args)
    local theme = args.args
    if theme == "" then
      -- List available themes
      local theme_list = {}
      for name, _ in pairs(themes) do
        table.insert(theme_list, name)
      end
      vim.notify("Available themes: " .. table.concat(theme_list, ", "), vim.log.levels.INFO)
    else
      M.set_theme(theme)
    end
  end, { nargs = "?", complete = function()
    local completions = {}
    for name, _ in pairs(themes) do
      table.insert(completions, name)
    end
    return completions
  end, desc = "Switch theme" })
  
  vim.api.nvim_create_user_command("ThemeSave", function()
    local current_theme = M.load_saved_theme()
    if current_theme then
      vim.notify("Current theme: " .. current_theme, vim.log.levels.INFO)
    else
      vim.notify("No theme saved", vim.log.levels.WARN)
    end
  end, { desc = "Show saved theme" })
end

return M
