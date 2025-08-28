return {
  -- Popular themes for easy switching
  
  -- Tokyo Night (default LazyVim theme) - SET AS DEFAULT
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = false,
        terminal_colors = true,
      })
    end,
  },
  
  -- Catppuccin (warm dark theme)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 999,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = false,
        term_colors = true,
      })
    end,
  },
  
  -- Rose Pine (elegant dark theme)
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 998,
    config = function()
      require("rose-pine").setup({
        variant = "main", -- auto, main, moon, dawn
        dark_variant = "main",
        transparent_background = false,
      })
    end,
  },
  
  -- Gruvbox (classic dark theme)
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 997,
    config = function()
      require("gruvbox").setup({
        transparent_mode = false,
        terminal_colors = true,
      })
    end,
  },
  
  -- Solarized Light (classic light theme)
  {
    'maxmx03/solarized.nvim',
    lazy = true,
    priority = 995,
    ---@type solarized.config
    opts = {
      variant = 'winter', -- "spring" | "summer" | "autumn" | "winter" (default)
    },
    config = function(_, opts)
      require('solarized').setup(opts)
      -- vim.cmd.colorscheme 'solarized'
    end,
  },

  -- GitHub Dark Dimmed
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup({
        options = {
          transparent = false,
        },
        terminal_colors = true,
      })
      
      -- Set as default theme
      vim.cmd.colorscheme('github_dark_dimmed')
    end,
  },

  -- Theme persistence - remember the last selected theme
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" } },
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },
}
