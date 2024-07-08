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
