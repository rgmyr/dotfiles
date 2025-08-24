-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Map jj to <Esc> in insert mode
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

-- Map ; to : in normal mode
vim.keymap.set("n", ";", ":", { noremap = true })

-- Make 'd' delete without yanking (true delete)
vim.keymap.set({ "n", "v" }, "d", '"_d', { desc = "Delete without yank" })
vim.keymap.set({ "n", "v" }, "D", '"_D', { desc = "Delete line without yank" })

-- Edit config with chezmoi
vim.keymap.set(
	"n",
	"<leader>rc",
	"<cmd>!chezmoi edit ~/.config/nvim/lua/config/keymaps.lua<cr>",
	{ desc = "Edit keymaps" }
)

-- VSCode-like keybindings for better compatibility
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("n", "<C-/>", "gcc", { desc = "Toggle comment", remap = true })
vim.keymap.set("v", "<C-/>", "gc", { desc = "Toggle comment", remap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
