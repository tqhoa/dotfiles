local status, comment = pcall(require, "nvim_comment")
if (not status) then  return end

comment.setup({
  comment_empty = false,
  marker_padding = true,
  create_mappings = true,
  line_mapping = 'gcc',
  operator_mapping = 'gc',
  hook = nil
})

vim.cmd([[
  autocmd BufEnter *.php, *.vue, *.css, *.scss, *.py, *.ts :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
  autocmd BufFilePost *.php, *.vue, *.css, *.scss, *.py, *.ts :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
]])
