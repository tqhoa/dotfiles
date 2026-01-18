return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = { enable = true }, ---@type lazyvim.TSFeat
      highlight = { enable = true }, ---@type lazyvim.TSFeat
      folds = { enable = true }, ---@type lazyvim.TSFeat
      ensure_installed = {
        "vue",
        "css",
        "scss",
        "http",
      },
    },
  },
  {
    "hiphish/rainbow-delimiters.nvim",
    config = function()
      --local rainbow_delimiters = require("rainbow-delimiters")
      vim.g.rainbow_delimiters = {
        --strategy = {
        --  [""] = rainbow_delimiters.strategy["global"],
        --  vim = rainbow_delimiters.strategy["local"],
        --},
        --query = {
        --  [""] = "rainbow-delimiters",
        --  lua = "rainbow-blocks",
        -- },
        highlight = {
          "RainbowDelimiterGreen",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
          "RainbowDelimiterRed",
        },
      }
    end,
  },
}
