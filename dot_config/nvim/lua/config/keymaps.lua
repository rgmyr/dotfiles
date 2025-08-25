-- Essential custom keymaps (LazyVim provides most defaults)

-- My favorite keymaps
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", ";", ":", { noremap = true })
-- Delete without yanking
vim.keymap.set({ "n", "v" }, "d", '"_d', { desc = "Delete without yank" })
vim.keymap.set({ "n", "v" }, "D", '"_D', { desc = "Delete line without yank" })

-- Chezmoi config editing
vim.keymap.set("n", "<leader>rc", "<cmd>!chezmoi edit ~/.config/nvim/lua/config/keymaps.lua<cr>", { desc = "Edit keymaps" })

-- Supermaven AI assistant (works automatically with inline completion)
-- Default keymaps: <Tab> to accept, <C-]> to clear, <C-j> to accept word

-- Default Dark Themes
vim.keymap.set("n", "<leader>tt", "<cmd>set background=dark<cr><cmd>colorscheme tokyonight<cr>", { desc = "Theme: Tokyo Night" })
vim.keymap.set("n", "<leader>tc", "<cmd>set background=dark<cr><cmd>colorscheme catppuccin<cr>", { desc = "Theme: Catppuccin" })
vim.keymap.set("n", "<leader>tr", "<cmd>set background=dark<cr><cmd>colorscheme rose-pine<cr>", { desc = "Theme: Rose Pine" })
vim.keymap.set("n", "<leader>tb", "<cmd>set background=dark<cr><cmd>colorscheme gruvbox<cr>", { desc = "Theme: Gruvbox" })
vim.keymap.set("n", "<leader>tg", "<cmd>set background=dark<cr><cmd>colorscheme github_dark_dimmed<cr>", { desc = "Theme: GitHub Dark Dimmed" })

-- Default Light Themes
vim.keymap.set("n", "<leader>ts", "<cmd>set background=light<cr><cmd>colorscheme solarized<cr>", { desc = "Theme: Solarized Light" })

-- Light/Dark mode toggle
vim.keymap.set("n", "<leader>tl", "<cmd>set background=light<cr>", { desc = "Toggle: Light mode" })
vim.keymap.set("n", "<leader>tdk", "<cmd>set background=dark<cr>", { desc = "Toggle: Dark mode" })
