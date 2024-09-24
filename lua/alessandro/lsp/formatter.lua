-- Copyright (C) 2024  Alessandro Marostica

--   This program is free software: you can redistribute it and/or modify
--   it under the terms of the GNU General Public License as published by
--   the Free Software Foundation, either version 3 of the License, or
--   (at your option) any later version.

--   This program is distributed in the hope that it will be useful,
--   but WITHOUT ANY WARRANTY; without even the implied warranty of
--   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--   GNU General Public License for more details.

--   You should have received a copy of the GNU General Public License
--   along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
end, { desc = "Format" })
