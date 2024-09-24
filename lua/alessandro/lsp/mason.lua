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

local servers = {
  "lua_ls",
  "pyright",
  "jsonls",
  "clangd",
  "bashls",
  "asm_lsp",
  "cmake",
  "csharp_ls",
  "dockerls",
  "yamlls",
  "vhdl_ls",
}

local lint_and_form = {
  -- Linters
  "cmakelang",
  "cpplint",
  "eslint_d",
  "flake8",
  "jsonlint",
  "luacheck",
  "shellcheck",
  "yamllint",

  -- Formatters
  "asmfmt",
  "black",
  "clang-format",
  "cmakelang",
  "prettier",
  "shfmt",
  "stylua"
}

local settings = {
  ensure_installed = lint_and_form, -- Don't think it works
  ui = {
    border = "none",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})
require("mason-tool-installer").setup({
  ensure_installed = lint_and_form
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  print "lspconfig did not initialize"
  return
end 

local opts = {}

for _, server in pairs(servers) do 
  opts = {
    on_attach = require("alessandro.lsp.handlers").on_attach,
    capabilities = require("alessandro.lsp.handlers").capabilities,
  }

  server = vim.split(server, "0")[1]

  -- Put language server settings in a file under settings dir which is named like the entries in the servers list at the top of this file
  local require_ok, conf_opts = pcall(require, "user.lsp.settings" .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end 

  lspconfig[server].setup(opts)
end
