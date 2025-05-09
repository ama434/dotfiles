return {
  'akinsho/bufferline.nvim',
  version = "*",
  priority = 1001,
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup({
      options = {
        style_preset = require("bufferline").style_preset.default,
        separator_style = "thick",
        numbers = function(opts)
          return string.format("%s", opts.raise(opts.id))
        end,
      }
    })
  end
}

