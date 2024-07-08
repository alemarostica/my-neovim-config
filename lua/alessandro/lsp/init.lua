local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("alessandro.lsp.mason")
require("alessandro.lsp.handlers").setup()
-- require("alessandro.lsp.null-ls")
require("alessandro.lsp.formatter")
require("alessandro.lsp.nvim-lint")
