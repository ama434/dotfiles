return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "bash", "zsh", "powershell", "awk", "perl", "ruby", "python",
      "cpp", "rust", "go", "zig", "java", "kotlin", "swift",
      "html", "css", "scss", "javascript", "typescript", "tsx", "jsx", "astro",
      "json", "yaml", "toml", "ini", "xml", "csv", "tsv",
      "dockerfile", "make", "cmake", "ssh_config", "gitignore", "diff",
      "gotmpl", "sql", "gnuplot",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        if string.find(vim.bo[args.buf].filetype, "chezmoitmpl") then
          return
        end
        -- パーサーがないファイルタイプでは従来の syntax のままにする
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
