-- fetch keymap
local map = vim.api.nvim_set_keymap

-- update leader key to space
vim.g.mapleader = " "

-- Y を行末までヤンクに
vim.keymap.set('n', 'Y', 'y$')

-- バッファ移動
vim.keymap.set('n', '<C-j>', ':bp<CR>')
vim.keymap.set('n', '<C-k>', ':bn<CR>')

-- 行末移動
vim.keymap.set('n', '<Space>l', '$')

-- U で Redo
vim.keymap.set('n', 'U', '<C-r>')

-- VISUAL モードにおいて <, >で連続してインデントを操作
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- ペーストした時に自動でインデントを調整
vim.keymap.set('n', 'p', ']p')
vim.keymap.set('n', 'P', ']P')
