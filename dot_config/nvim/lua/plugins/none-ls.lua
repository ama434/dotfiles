return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "vim-test/vim-test",
  },
  config = function()
    local null_ls = require("null-ls")
    local b = null_ls.builtins -- エイリアス
    null_ls.setup({
      debug = true, -- 必要に応じて true に
      sources = {
        -- none-ls で使いたいフォーマッタやリンタをここに追加
        b.diagnostics.textlint.with({
          filetypes = { "tex", "markdown", "text" },
          -- dynamic_command = function(params)
          --   vim.notify("root=" .. tostring(params.root), vim.log.levels.WARN)
          --   if not params.root then
          --     return "textlint"
          --   end
          --   local local_bin = params.root .. "/node_modules/.bin/textlint"
          --   vim.notify("bin executable=" .. tostring(vim.fn.executable(local_bin)), vim.log.levels.WARN)
          --   if vim.fn.executable(local_bin) == 1 then
          --     return local_bin
          --   end
          --   return "textlint"
          -- end,
        }),
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = "MyNullLsFormat", buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = "MyNullLsFormat",
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                bufnr = bufnr,
                filter = function(cl)
                  return cl.name == "null-ls"
                end,
                timeout_ms = 5000,
              })
            end,
          })
        end
      end
    })
  end,
}
