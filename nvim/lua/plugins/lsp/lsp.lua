return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local opts = { noremap = true, silent = false }
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    capabilities.offsetEncoding = "utf-8"
    local on_attach = function(client, bufnr)
      vim.o.updatetime = 250

      opts.desc = "Show LSP implementations"
      vim.keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations bufnr=0<CR>", opts)

      opts.desc = "Show LSP type definitions"
      vim.keymap.set("n", "<leader>gD", "<cmd>Telescope lsp_type_definitions<CR>", opts)

      opts.desc = "Show LSP definitions"
      vim.keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", opts)

      opts.desc = "Show buffer diagnostics"
      vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

      -- LSP Saga
      opts.desc = "Hover LSP diagnostic"
      vim.keymap.set("n", "<leader>sh", "<cmd> Lspsaga hover_doc<CR>", opts)

      opts.desc = "Goto LSP definition"
      vim.keymap.set("n", "<leader>sg", "<cmd> Lspsaga goto_definition<CR>", opts)

      opts.desc = "Prev LSP diagnostic"
      vim.keymap.set("n", "<leader>sD", "<cmd> Lspsaga diagnostic_jump_prev<CR>", opts)

      opts.desc = "Next LSP diagnostic"
      vim.keymap.set("n", "<leader>sd", "<cmd> Lspsaga diagnostic_jump_next<CR>", opts)

      opts.desc = "Find definition"
      vim.keymap.set("n", "<leader>sf", "<cmd> Lspsaga finder<CR>", opts)

      opts.desc = "Peek definition"
      vim.keymap.set("n", "<leader>sp", "<cmd> Lspsaga peek_definition<CR>", opts)

      opts.desc = "Terminal toggle"
      vim.keymap.set("n", "<M-c>", "<cmd> Lspsaga term_toggle<CR>", opts)
      vim.keymap.set("t", "<M-c>", "<cmd> Lspsaga term_toggle<CR>", opts)

      opts.desc = "Show documentation for what is under cursor"
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

      opts.desc = "Show LSP code actions"
      vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)

      opts.desc = "Rename LSP symbol"
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.rename, opts)

      opts.desc = "Show LSP references"
      vim.keymap.set("n", "<leader>gR", "<cmd>Lspsaga finder tyd+ref+def<CR>", opts)
    end

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end,
    })
  end,
}
