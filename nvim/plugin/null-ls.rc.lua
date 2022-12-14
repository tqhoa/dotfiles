local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

null_ls.setup ({
  debug = false,

  sources = {
    null_ls.builtins.formatting.eslint_d,

    null_ls.builtins.formatting.prettierd.with({
      filetypes = {"css", "scss", "less", "json", "yaml", "html", "markdown"}
    }),

    null_ls.builtins.diagnostics.fish,
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.phpcsfixer,
  },

  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_clear_autocmds { buffer = 0, group = augroup_format }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = 0,
        callback = function() vim.lsp.buf.formatting_seq_sync() end
      })
    end
  end,
})
