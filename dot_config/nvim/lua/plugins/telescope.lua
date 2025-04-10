return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    -- ファイル検索
    {
      "<leader>ff",
      function() require("telescope.builtin").find_files() end,
      desc = "Telescope: ファイルを検索",
    },
    -- ライブ検索
    {
      "<leader>fg",
      function() require("telescope.builtin").live_grep() end,
      desc = "Telescope: ライブ検索",
    },
    -- バッファ検索
    {
      "<leader>fb",
      function() require("telescope.builtin").buffers() end,
      desc = "Telescope: バッファを検索",
    },
    -- ヘルプタグ検索
    {
      "<leader>fh",
      function() require("telescope.builtin").help_tags() end,
      desc = "Telescope: ヘルプタグを検索",
    },
    -- カスタム文字列検索
    {
      "<leader>fs",
      function()
        require("telescope.builtin").grep_string({ search = vim.fn.input("Search > ") })
      end,
      desc = "Telescope: カスタム検索文字列で検索",
    },
  }
}
