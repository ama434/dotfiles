return {
  'akinsho/bufferline.nvim',
  version = "*",
  priority = 999,
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local mocha = require("catppuccin.palettes").get_palette("mocha")
    require("bufferline").setup({
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
      options = {
        style_preset = require("bufferline").style_preset.default,
        separator_style = "thick",
        numbers = function(opts)
          return string.format("%s", opts.raise(opts.id))
        end,
      },
    })
  end
}

