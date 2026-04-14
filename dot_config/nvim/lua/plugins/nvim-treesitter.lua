return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter.configs').setup({
      highlight = {
        disable = function()
          if string.find(vim.bo.filetype, 'chezmoitmpl') then
            return true
          end
        end,
      },
    })
  end
}
