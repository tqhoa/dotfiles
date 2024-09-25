local status, dapui = pcall(require, "dapui")
local status_dap, dap = pcall(require, "dap")
if not (status and status_dap) then return end

vim.fn.sign_define('DapBreakpoint', { text = '🐞' })

dapui.setup()

-- Start debugging session
vim.keymap.set("n", "ds", function()
  dap.continue()
  dapui.toggle({})
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false) -- Spaces buffers evenly
end)

-- Set breakpoints, get variable values, step into/out of functions, etc.
vim.keymap.set("n", "dl", require("dap.ui.widgets").hover)
vim.keymap.set("n", "dc", dap.continue)
vim.keymap.set("n", "db", dap.toggle_breakpoint)
vim.keymap.set("n", "dn", dap.step_over)
vim.keymap.set("n", "di", dap.step_into)
vim.keymap.set("n", "do", dap.step_out)
--vim.keymap.set("n", "dC", function()
--  dap.clear_breakpoints()
--  require("notify")("Breakpoints cleared", "warn")
--end)

-- Close debugger and clear breakpoints
vim.keymap.set("n", "de", function()
  dapui.close({})
  dap.terminate()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
  require("notify")("Debugger session ended", "info")
end)
