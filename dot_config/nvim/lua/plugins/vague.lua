return {
  "vague2k/vague.nvim",
  config = function()
    require("vague").setup({
      transparent = vim.g.transparent_enabled,
      style = {
        string = "none",
      },
    })
  end
}
