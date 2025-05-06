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
      debug = false, -- 必要に応じて true に
      sources = {
        -- none-ls で使いたいフォーマッタやリンタをここに追加
        b.diagnostics.textlint,
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
