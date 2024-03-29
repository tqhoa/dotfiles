local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
-- keymap.set('n', 'te', ':tabedit')
keymap.set('n', 'te', '<cmd> tabedit <cr>')

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Tools
-- bindings Nvimtree, LazyGit, Autosave
keymap.set('n', '<Leader>gg', '<cmd> LazyGit <cr>')
keymap.set('n', 'ee', '<cmd> NvimTreeOpen <cr>')
keymap.set('n', 'ex', '<cmd> NvimTreeClose <cr>')

-- Autosave
keymap.set('n', '<leader>as', '<cmd> ASToggle <cr>')

keymap.set('i', 'jk', '<ESC>', {noremap = true, silent = false})
keymap.set('i', 'kj', '<ESC>', {noremap = true, silent = false})

keymap.set('n', 'wk', '<cmd> WhichKey <cr>')

-- MINI
keymap.set('n', 'mf', '<cmd>lua MiniFiles.open() <cr>')
