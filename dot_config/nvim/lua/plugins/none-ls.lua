return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "vim-test/vim-test",
  },
  config = function()
    local null_ls = require("null-ls")
    local b = null_ls.builtins -- エイリアス
    -- プロジェクトに textlint がないときに使う共通環境（package.json と設定は chezmoi で管理）
    local textlint_home = vim.env.HOME .. "/.config/textlint"
    local find_local_textlint = require("null-ls.helpers.command_resolver").generic("node_modules/.bin")
    null_ls.setup({
      debug = true, -- 必要に応じて true に
      sources = {
        -- none-ls で使いたいフォーマッタやリンタをここに追加
        b.diagnostics.textlint.with({
          filetypes = { "tex", "markdown", "text" },
          -- プロジェクトの node_modules に textlint があればそれを、なければ共通環境のものを使う
          dynamic_command = function(params, done)
            find_local_textlint(params, function(resolved)
              done(resolved or textlint_home .. "/node_modules/.bin/textlint")
            end)
          end,
          -- プロジェクトに設定ファイルがなければ共通環境の設定を使う
          extra_args = function(params)
            local found = vim.fs.find({
              ".textlintrc",
              ".textlintrc.json",
              ".textlintrc.yml",
              ".textlintrc.yaml",
              ".textlintrc.js",
              ".textlintrc.cjs",
            }, { upward = true, path = vim.fs.dirname(params.bufname) })[1]
            if found then
              return {}
            end
            return { "--config", textlint_home .. "/.textlintrc.json" }
          end,
          -- プロジェクトにないルールは共通環境から解決する
          env = { NODE_PATH = textlint_home .. "/node_modules" },
        }),
      },
      on_attach = function(client, bufnr)
        if client:supports_method("textDocument/formatting") then
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
