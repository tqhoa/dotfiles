--[[
return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP server
        "pyright",
        "tailwindcss-language-server",
        "typescript-language-server",
        "vue-language-server",
      },
    },
  },
}
--]]

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
        -- "ts_ls",
        -- "html",
        -- "cssls",
        -- "tailwindcss",
        -- "svelte",
        -- "lua_ls",
        -- "graphql",
        -- "emmet_ls",
        -- "prismals",
        "pyright",
        -- "rust-analyzer",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- "prettier", -- prettier formatter
        -- "stylua", -- lua formatter
        -- "isort", -- python formatter
        -- "ruff",
        "debugpy",
        "black",
        -- "eslint_d",
      },
    })
  end,
}
