local status, gitsigns = pcall(require, 'gitsigns')
if (not status) then return end


gitsigns.setup {
  -- Current line blame
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 250,
    ignore_whitespace = false
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>'
}
