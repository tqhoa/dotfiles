return {
  "svrana/neosolarized.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("neosolarized").setup({
      comment_italics = true,
      background_set = false,
    })
    vim.cmd.colorscheme("neosolarized")
  end,
  dependencies = {
    "tjdevries/colorbuddy.nvim",
  },
}
