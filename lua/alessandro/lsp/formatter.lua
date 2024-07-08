local status_ok, conform = pcall(require, "conform")
if not status_ok then
  print("conform did not initialize")
  return
end

conform.setup {
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    svelte = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    graphql = { "prettier" },
    lua = { "stylua" },
    python = { "black" },
    c = { "clang-format" },
    assembly = { "asmfmt" },
    cs = { "clang-format" },
    cpp = { "clang-format" },
    cmake = { "cmake_format" },
    sh = { "shfmt" },
  }
}

vim.keymap.set({ "n", "v" }, "<leader>mp", function ()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  })
end)
