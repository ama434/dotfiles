return {
  "lervag/vimtex",
  lazy = false,
  -- tag = "v2.15",
  init = function()
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_quickfix_open_on_warning = 0
  end
}
