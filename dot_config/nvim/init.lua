-- key
require("keymaps")

-- plugins
require("config.lazy")

require("lazy").setup("plugins", {
  performance = {
    rtp = {
      disabled_plugins = {
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
      },
    },
  },
})

require("bufferline").setup{
  options = {
    style_preset = require("bufferline").style_preset.default,
    separator_style = "thick",
    numbers = function(opts)
      return string.format('%s', opts.raise(opts.id))
    end,
  },
}

require("fidget").setup()

require("gitsigns").setup()

require("mason").setup()

-- lsp
require("lsp-init")

-- auto command
require("autocmds")

-- encoding
vim.opt.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

-- visual
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.visualbell = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true
vim.cmd('hi clear CursorLine')
vim.opt.list = true
vim.opt.scrolloff = 10
vim.opt.listchars = { tab = '|.', trail = '-', extends = '»', precedes = '«', nbsp = '%' }
vim.opt.showmatch = true
vim.opt.matchtime = 1
vim.opt.breakindent = true
vim.opt.showbreak = '» '

-- color
vim.opt.termguicolors = true
vim.cmd.colorscheme "catppuccin"

-- search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- terminal
vim.opt.sh = zsh

-- PATH
-- Prepend mise shims to PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

-- show diagnostics info
vim.diagnostic.config({
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
