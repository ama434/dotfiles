return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "saadparwaiz1/cmp_luasnip",
  },
  version = "v2.*",
  build = "make install_jsregexp",
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load({
      paths = {
        vim.fn.stdpath("data") .. "/lazy/friendly-snippets",
        './snippets',
      }
    })
  end,
}
