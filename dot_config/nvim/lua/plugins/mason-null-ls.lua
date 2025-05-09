return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason-org/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  config = function ()
    require("mason-null-ls").setup({
      automatic_setup = true,
      handlers = {},
    })
  end
}
