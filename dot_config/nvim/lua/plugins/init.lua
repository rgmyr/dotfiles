return {
	-- Language support (matches VSCode extensions)
	{ import = "lazyvim.plugins.extras.lang.typescript" },
	{ import = "lazyvim.plugins.extras.lang.json" },
	{ import = "lazyvim.plugins.extras.lang.rust" },
	{ import = "lazyvim.plugins.extras.lang.python" },

	-- UI improvements
	{ import = "lazyvim.plugins.extras.ui.mini-starter" },

	-- Simple jump out of brackets/quotes with Shift+Tab
	{
		"abecodes/tabout.nvim",
		lazy = false,
		config = function()
			require("tabout").setup({
				tabkey = "", -- disable regular tab
				backwards_tabkey = "", -- disable shift+tab backwards
				act_as_tab = true,
				completion = false,
				tabouts = {
					{ open = "'", close = "'" },
					{ open = '"', close = '"' },
					{ open = "`", close = "`" },
					{ open = "(", close = ")" },
					{ open = "[", close = "]" },
					{ open = "{", close = "}" },
				},
			})
			-- Manual keymap for just Shift+Tab forward
			vim.keymap.set("i", "<S-Tab>", "<Plug>(TaboutMulti)", { silent = true })
		end,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},

	-- VSCode-like file explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},
		},
	},

	-- Better commenting (like VSCode Ctrl+/)
	{
		"numToStr/Comment.nvim",
		opts = {},
	},

	-- Git integration (like VSCode git lens)
	{ import = "lazyvim.plugins.extras.vscode" }, -- VSCode-specific optimizations

	-- Telescope with VSCode-like bindings
	{
		"nvim-telescope/telescope.nvim",
		keys = {
			-- VSCode-like keybindings
			{ "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<C-S-p>", "<cmd>Telescope commands<cr>", desc = "Commands" },
			{ "<C-S-f>", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
		},
		opts = {
			defaults = {
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,
			},
		},
	},

	-- LSP configuration (same servers as VSCode)
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				pyright = {},
				tsserver = {},
				rust_analyzer = {},
			},
		},
	},

	-- Treesitter for better syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"bash",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"python",
				"rust",
				"tsx",
				"typescript",
				"vim",
				"yaml",
			},
		},
	},

	-- Essential tools
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"shellcheck",
				"shfmt",
				"flake8",
				"prettier",
				"eslint_d",
				"rust-analyzer",
			},
		},
	},
}
