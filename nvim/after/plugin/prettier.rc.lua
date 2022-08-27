local status, prettier = pcall(require, "prettier")
if (not status) then return end

prettier.setup ({
  bin = 'prettierd',
  filetypes = {
    "css",
    "javascript",
    "typescript",
    "json",
    "scss",
    "less",
    "html",
    "yaml",
    "markdown"
  }
})


--config for editorconfig
--vim.g.EditorConfig_max_line_indicator = "none"
