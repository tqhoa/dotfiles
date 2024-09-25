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
  autocmd BufEnter *.css, *.scss, *.ts :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
  autocmd BufFilePost *.css, *.scss, *.ts :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
]])
