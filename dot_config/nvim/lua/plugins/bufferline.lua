return {
  'akinsho/bufferline.nvim',
  -- after = 'catppuccin',
  version = "*",
  priority = 999,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    -- 'catppuccin/nvim',
  },
  config = function()
    -- local mocha = require("catppuccin.palettes").get_palette("mocha")
    require("bufferline").setup({
      -- highlights = require("catppuccin.special.bufferline").get_theme(),
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

