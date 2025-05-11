return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    require("mason").setup({
      ui = {
        border = "rounded",
      },
    })
  end
}
