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

local status_ok, lint = pcall(require, "lint")
if not status_ok then
	print("nvim-lint did not initialize")
	return
end

lint.linters_by_ft = {
	cmake = { "cmakelang" },
	c = { "cpplint" },
	cpp = { "cpplint" },
	python = { "flake8" },
	json = { "jsonlint" },
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	lua = { "luacheck" },
	sh = { "shellcheck" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({
	"BufEnter",
	"BufWritePost",
	"InsertLeave",
	"TextChanged",
}, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})

vim.keymap.set("n", "<leader>l", function()
	lint.try_lint()
end)
