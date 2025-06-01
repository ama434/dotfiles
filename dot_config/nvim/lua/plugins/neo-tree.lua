return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = true,
  cmd = { "Neotree" }, -- コマンドで呼び出されたときのみ読み込み
  keys = {
    {
      "<leader>nn",
      ":Neotree toggle<CR>",
      desc = "Neo-tree: ファイルツリーを開閉",
    },
  },
  ---@module "neo-tree"
  ---@type neotree.config?
  opts = {
    filesystem = {
      hijack_netrw_behavior = "disabled",
    },
  },
}
