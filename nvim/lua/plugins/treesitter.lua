return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    --"p00f/nvim-ts-rainbow",
  },
  opts = {
    ensure_installed = {
      "vue",
      "css",
      "scss",
      "http",
    },

    --rainbow = { enable = true, disable = {}, extended_mode = true, max_file_lines = nil },
  },
}
