-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local keymap = vim.keymap

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Tabs
keymap.set("n", "te", "<cmd> tabedit <cr>")

-- Split window
--keymap.set("n", "ss", ":split<veturn><C-w>w")
--keymap.set("n", "sv", ":vsplit<Return><C-w>w")
keymap.set("n", "ss", "<Cmd>:split<cr>")
keymap.set("n", "sv", "<Cmd>:vsplit<cr>")

-- Move window
keymap.set("n", "<Space>", "<C-w>w")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- closed window
keymap.set("n", "wq", "<Cmd>:wq<cr>")
keymap.set("n", "wa", "<Cmd>:wqa<cr>")
keymap.set("n", "qq", "<Cmd>:q!<cr>")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

keymap.set("i", "jj", "<ESC>", { noremap = true, silent = false })
keymap.set("i", "kk", "<ESC>", { noremap = true, silent = false })

keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })

-- Plugins
