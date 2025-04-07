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

require("lualine").setup {
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    refresh = {
      statusline = 33,
      tabline = 33,
      winbar = 33,
    },
  }
}

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
vim.opt.list = true
vim.opt.scrolloff = 15
vim.opt.listchars = { tab = '|.', trail = '-', extends = '»', precedes = '«', nbsp = '%' }
vim.opt.showmatch = true
vim.opt.matchtime = 1

-- search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
