-- Essential custom keymaps (LazyVim provides most defaults)

-- My favorite keymaps
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", ";", ":", { noremap = true })
-- Delete without yanking
vim.keymap.set({ "n", "v" }, "d", '"_d', { desc = "Delete without yank" })
vim.keymap.set({ "n", "v" }, "D", '"_D', { desc = "Delete line without yank" })

-- Quick Exit (quit all the way back to terminal)
vim.keymap.set("n", "<leader>qq", "<cmd>qa!<cr>", { desc = "Force quit all (exit Neovim)" })
vim.keymap.set("n", "<leader>qw", "<cmd>wqa!<cr>", { desc = "Save all and quit" })

-- Chezmoi config editing
vim.keymap.set("n", "<leader>rc", "<cmd>!chezmoi edit ~/.config/nvim/lua/config/keymaps.lua<cr>", { desc = "Edit keymaps" })

-- Supermaven AI assistant (works automatically with inline completion)
-- Default keymaps: <Tab> to accept, <C-]> to clear, <C-j> to accept word

-- Autopairs Navigation
-- Shift+Tab: Jump to next closing character (works in insert and normal mode)
-- Alt+e: Fast wrap selection with pairs
vim.keymap.set("n", "<leader>ap", "<cmd>lua require('nvim-autopairs').setup()<cr>", { desc = "Reload autopairs" })

-- Persistent Theme Switching (using theme manager)
vim.keymap.set("n", "<leader>tt", "<cmd>lua require('config.theme-manager').set_theme('tokyonight')<cr>", { desc = "Theme: Tokyo Night" })
vim.keymap.set("n", "<leader>tc", "<cmd>lua require('config.theme-manager').set_theme('catppuccin')<cr>", { desc = "Theme: Catppuccin" })
vim.keymap.set("n", "<leader>tr", "<cmd>lua require('config.theme-manager').set_theme('rose_pine')<cr>", { desc = "Theme: Rose Pine" })
vim.keymap.set("n", "<leader>tb", "<cmd>lua require('config.theme-manager').set_theme('gruvbox')<cr>", { desc = "Theme: Gruvbox" })
vim.keymap.set("n", "<leader>tg", "<cmd>lua require('config.theme-manager').set_theme('github_dark_dimmed')<cr>", { desc = "Theme: GitHub Dark Dimmed" })

-- Light Theme
vim.keymap.set("n", "<leader>ts", "<cmd>lua require('config.theme-manager').set_theme('solarized')<cr>", { desc = "Theme: Solarized Light" })

-- Theme Management
vim.keymap.set("n", "<leader>tl", "<cmd>Theme<cr>", { desc = "List/Switch themes" })
vim.keymap.set("n", "<leader>tsave", "<cmd>ThemeSave<cr>", { desc = "Show saved theme" })

-- Legacy theme commands (kept for compatibility)
vim.keymap.set("n", "<leader>tdk", "<cmd>set background=dark<cr>", { desc = "Toggle: Dark mode" })
