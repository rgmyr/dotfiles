-- Set leader key to backslash
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Basic Neovim settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

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

-- Telescope keymaps
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
vim.keymap.set("n", "<C-S-p>", "<cmd>Telescope commands<cr>", { desc = "Commands" })
vim.keymap.set("n", "<C-S-f>", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })

-- File explorer
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })