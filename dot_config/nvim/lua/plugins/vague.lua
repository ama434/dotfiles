return {
  "vague2k/vague.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("vague").setup({
      transparent = vim.g.transparent_enabled,
      style = {
        string = "none",
      },
    })
    vim.cmd("colorscheme vague")
  end
}
