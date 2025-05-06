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
        sources = { "nvim_lsp" },
        sections = { "error", "warn", "info", "hint" },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = '' },
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

require("mason").setup()

require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    }
  end,
}

require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})

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
