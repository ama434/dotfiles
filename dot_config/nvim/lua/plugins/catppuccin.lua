return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup {
      flavour = "mocha",
      background = {
        light = "latte",
        dark = "mocha",
      },
      integrations = {
        noice = true,
        notify = true,
      },
      transparent_background = vim.g.transparent_enabled,
    }
  end
}
