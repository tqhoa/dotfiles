local status, wk = pcall(require, 'which-key')
if not status then return end

local keymap = vim.keymap
local setup = {
  window = {
    border = "single",
    padding = { 2, 2, 2, 2 }
  }
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
}

wk.setup(setup)
wk.register(mappings, opts)

