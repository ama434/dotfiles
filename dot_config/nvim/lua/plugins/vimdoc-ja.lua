return {
  "vim-jp/vimdoc-ja",
  event = "VeryLazy",
  -- lazy.nvim の helptags が doc/tags-ja を書き換え、次回の更新が失敗するため元に戻す
  build = "git checkout -- doc/tags-ja",
}
