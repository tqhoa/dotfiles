return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      PATH = "append",
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "graphql",
        "pyright",
        "volar",
        --"gopls",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- "eslint_d", -- elslint formatter
        "prettier",
        "stylua",
        "debugpy",
        "black",
        --"goimports",
        --"gofumpt",
        --"delve",
      },
    })
  end,
}
