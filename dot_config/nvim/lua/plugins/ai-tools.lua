return {
  -- AI coding assistant
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        -- Use default configuration
        -- Supermaven will work automatically with inline completion
      })
    end,
  },
}
