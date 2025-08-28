return {
  -- Auto-pairs with smart navigation
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true, -- Enable tree-sitter integration
      ts_config = {
        lua = { "string", "source" },
        javascript = { "string", "template_string" },
        typescript = { "string", "template_string" },
        html = { "string" },
        css = { "string" },
        python = { "string" },
        rust = { "string" },
        go = { "string" },
        c = { "string" },
        cpp = { "string" },
      },
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
      fast_wrap = {
        map = "<M-e>", -- Alt+e to wrap
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0, -- Offset from line wrap
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
      },
    },
    config = function(_, opts)
      local autopairs = require("nvim-autopairs")
      autopairs.setup(opts)
      
      -- Custom keymaps for navigation through pairs
      local Rule = require("nvim-autopairs.rule")
      local cond = require("nvim-autopairs.conds")
      
      -- Add custom rules for better pair handling
      autopairs.add_rules({
        -- Smart quotes that don't auto-pair in certain contexts
        Rule("'", "'", { "rust", "go", "c", "cpp" })
          :with_pair(cond.not_before_regex("%w"))
          :with_pair(cond.not_after_regex("%w")),
        
        -- Smart backtick handling for template strings
        Rule("`", "`", { "javascript", "typescript", "javascriptreact", "typescriptreact" })
          :with_pair(cond.not_before_regex("%w"))
          :with_pair(cond.not_after_regex("%w")),
      })
      
      -- Set up Shift+Tab navigation through closing characters
      vim.keymap.set("i", "<S-Tab>", function()
        local line = vim.api.nvim_get_current_line()
        local col = vim.api.nvim_win_get_cursor(0)[2] + 1
        
        -- Look for closing characters ahead
        local closing_chars = { ")", "]", "}", '"', "'", "`", ">" }
        local found_pos = nil
        
        for i = col + 1, #line do
          local char = line:sub(i, i)
          for _, closing in ipairs(closing_chars) do
            if char == closing then
              found_pos = i
              break
            end
          end
          if found_pos then break end
        end
        
        if found_pos then
          -- Jump THROUGH the closing character (position after it)
          vim.api.nvim_win_set_cursor(0, {vim.api.nvim_win_get_cursor(0)[1], found_pos + 1})
        else
          -- If no closing character found, insert a tab
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n", true)
        end
      end, { desc = "Jump through next closing character or insert tab" })
      
      -- Also add Shift+Tab in normal mode for consistency
      vim.keymap.set("n", "<S-Tab>", function()
        local line = vim.api.nvim_get_current_line()
        local col = vim.api.nvim_win_get_cursor(0)[2] + 1
        
        -- Look for closing characters ahead
        local closing_chars = { ")", "]", "}", '"', "'", "`", ">" }
        local found_pos = nil
        
        for i = col + 1, #line do
          local char = line:sub(i, i)
          for _, closing in ipairs(closing_chars) do
            if char == closing then
              found_pos = i
              break
            end
          end
          if found_pos then break end
        end
        
        if found_pos then
          -- Jump THROUGH the closing character (position after it)
          vim.api.nvim_win_set_cursor(0, {vim.api.nvim_win_get_cursor(0)[1], found_pos + 1})
        end
      end, { desc = "Jump through next closing character" })
    end,
  },

  -- HTML/JSX auto-tags (complements autopairs)
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {
      enable_close_on_slash = false, -- Don't auto-close on /
      enable_rename = true, -- Enable tag renaming
      enable_close = true, -- Enable auto-closing
      filetypes = {
        "html", "javascript", "typescript", "javascriptreact", "typescriptreact",
        "vue", "svelte", "xml", "markdown", "php", "erb", "ejs"
      },
    },
  },
}
