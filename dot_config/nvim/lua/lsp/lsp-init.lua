-- lsp settings

vim.lsp.config("*", {
  -- 共通設定
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.lsp.enable(require("mason-lspconfig").get_installed_servers())
