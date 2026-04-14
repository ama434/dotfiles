return {
  "mason-org/mason-lspconfig.nvim",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  dependencies = { "neovim/nvim-lspconfig", "mason-org/mason.nvim" },
  config = function ()
  	require("mason-lspconfig").setup()
  end
}
