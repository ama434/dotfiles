-- primary options
vim.opt.termguicolors = true
vim.opt.winblend = vim.g.transparent_enabled and 0 or 7
vim.opt.pumblend = vim.g.transparent_enabled and 0 or 7

-- key
require("keymaps")

-- plugins
require("config.lazy")

-- lsp
require("lsp/lsp-init")

-- auto command
require("autocmds")

-- encoding
vim.opt.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

-- indent
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- visual
vim.opt.visualbell = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true
vim.cmd('hi clear CursorLine')
vim.opt.list = true
vim.opt.scrolloff = 10
vim.opt.listchars = { tab = '|•', trail = '—', extends = '»', precedes = '«', nbsp = '%', eol = "" }
vim.opt.showmatch = true
vim.opt.matchtime = 1
vim.opt.breakindent = true
vim.opt.showbreak = '» '

-- color
vim.cmd.colorscheme "catppuccin-mocha"

-- search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- window
vim.opt.splitbelow = true
vim.opt.splitright = true

-- clipboard
vim.opt.clipboard:append{'unnamedplus'}

-- terminal
vim.opt.sh = "zsh"

-- PATH
-- Prepend mise shims to PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

-- show diagnostics info
vim.diagnostic.config({
  float = {
    border = "rounded",
  },
  virtual_text = {
    prefix = '',
    source = "if_many",
    spacing = 4,
    severity_sort = true,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
