-- Absolute minimal Neovim options
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.wrap = false
vim.opt.termguicolors = true

-- Enhanced UI options for better command completion and popups
vim.opt.wildmenu = true           -- Enhanced command-line completion
vim.opt.wildmode = "longest:full,full"  -- Command completion behavior
vim.opt.wildoptions = "pum"       -- Use popup menu for wildmenu
vim.opt.pumblend = 10             -- Popup menu transparency
vim.opt.pumheight = 10            -- Popup menu height
vim.opt.pumwidth = 20             -- Popup menu width
vim.opt.splitbelow = true         -- New windows below current
vim.opt.splitright = true         -- New windows right of current

-- Terminal compatibility
local term = vim.env.TERM or ""
local is_modern_terminal = vim.fn.has("termguicolors") == 1 and vim.fn.getenv("COLORTERM") ~= ""

-- Fallback options for limited terminals
if not is_modern_terminal then
  -- Disable advanced features for basic terminals
  vim.opt.termguicolors = false
  vim.opt.showmode = true  -- Show mode in basic terminals
  vim.opt.ruler = true     -- Show cursor position
  vim.opt.laststatus = 2   -- Always show status line
end

-- Log terminal info for debugging
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local term_info = {
      TERM = vim.env.TERM,
      COLORTERM = vim.env.COLORTERM,
      has_termguicolors = vim.fn.has("termguicolors"),
      is_modern = is_modern_terminal
    }
    vim.notify("Terminal: " .. vim.inspect(term_info), vim.log.levels.INFO)
  end,
  once = true
})
