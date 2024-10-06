return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      ["python"] = { "black" },
      ["javascript"] = { "prettier" },
      ["typescript"] = { "prettier" },
      ["vue"] = { "prettier" },
      -- typescriptreact = { "prettier" },
      -- svelte = { "prettier" },
      ["css"] = { "prettier" },
      ["html"] = { "prettier" },
      ["json"] = { "prettier" },
      ["yaml"] = { "prettier" },
      ["markdown"] = { "prettier" },
      ["graphql"] = { "prettier" },
      ["go"] = { "gofumpt", "goimports" },
    },
  },
}
