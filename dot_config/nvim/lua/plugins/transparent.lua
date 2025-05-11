return {
  "xiyaowong/transparent.nvim",
  keys = {
    {
      "<leader>tp",
      ":TransparentToggle<CR>",
      desc = "transparent: 透明背景をトグル",
    },
  },
  config = function ()
    require("transparent").setup()
    require('transparent').clear_prefix('BufferLine')
    require('transparent').clear_prefix('NeoTree')
  end
}
