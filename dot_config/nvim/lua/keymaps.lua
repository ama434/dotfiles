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

-- 「ZQ（保存せずに終了）」を無効化
vim.keymap.set('n', 'ZQ', '<NOP>')

-- 「新しいウィンドウを水平分割」を「新しいウィンドウを垂直分割」で上書き
vim.keymap.set('n', '<C-w><C-n>', ':vnew<CR>')

-- 新規タブでターミナルモードを起動
vim.keymap.set('n', 'tt', ':terminal<CR>')

-- 下分割でターミナルモードを起動
vim.keymap.set('n', 'tx', ':new<CR>:terminal<CR>')

-- ターミナルモードで <ESC> で normal モードに入れるように
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')

-- <leader>nn で neo-tree を開閉
vim.keymap.set('n', '<leader>nn', ':Neotree toggle<CR>')
