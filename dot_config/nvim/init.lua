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

require("catppuccin").setup {
  flavour = "mocha",
  background = {
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false,
}

require("lualine").setup {
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    refresh = {
      statusline = 33,
      tabline = 33,
      winbar = 33,
    },
  },
  sections = {
   lualine_b = {
      {
        "branch",
        icon = '',
      },
      {
        "diff",
        symbols = { added = " ", modified = " ", removed = " " },
      },
      {
        "diagnostics",
      },
    },
    lualine_c = {
      {
        "filename",
        path = 4,
        symbols = {
          modified = " ",
          readonly = "󰏯 ",
          new = " ",
        },
      },
    },
  },
}

require("bufferline").setup{
  options = {
    style_preset = require("bufferline").style_preset.default,
    separator_style = "thick",
    numbers = function(opts)
      return string.format('%s', opts.raise(opts.id))
    end,
  },
}

require("gitsigns").setup()

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
vim.opt.cursorline = true
vim.cmd('hi clear CursorLine')
vim.opt.list = true
vim.opt.scrolloff = 10
vim.opt.listchars = { tab = '|.', trail = '-', extends = '»', precedes = '«', nbsp = '%' }
vim.opt.showmatch = true
vim.opt.matchtime = 1

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
