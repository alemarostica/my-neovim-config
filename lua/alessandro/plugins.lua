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

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used in lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs integrates with cmp and treesitter

	-- colorschemes
	use("lunarvim/colorschemes") -- Some colorschemes from LunarVim/Neovim-from-scratch dude
	use("rebelot/kanagawa.nvim")
	use("ellisonleao/gruvbox.nvim")
	use({ "kepano/flexoki-neovim", as = "flexoki" })
	use("jacoborus/tender.vim")
	use("nyoom-engineering/oxocarbon.nvim")
	use("bluz71/vim-moonfly-colors")

	-- completion plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp") -- lsp completions
	use("hrsh7th/cmp-nvim-lua") -- vim lua obj autocompletion
	use("hrsh7th/cmp-nvim-lsp-signature-help") -- don't know what it is

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- lsp
	use("neovim/nvim-lspconfig") -- enable lsp
	use("williamboman/mason.nvim") -- simple to use language server installer
	use("williamboman/mason-lspconfig.nvim")
	use("WhoIsSethDaniel/mason-tool-installer.nvim") -- Auto installs Mason shit
	-- use "jose-elias-alvarez/null-ls.nvim" -- LSP diagnostic and code actions
	-- use "mhartington/formatter.nvim" -- In place of null-ls which has been archived
	use("stevearc/conform.nvim")
	use("mfussenegger/nvim-lint") -- ^^^
	use("simrat39/rust-tools.nvim")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }

	-- Treesitter and colors
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("hiphish/rainbow-delimiters.nvim")

	-- Commenting support
	use("numToStr/Comment.nvim") -- Esaily comment stuff
	use("JoosepAlviste/nvim-ts-context-commentstring") -- Makes commenting ts aware

	-- Git integration
	use({ "lewis6991/gitsigns.nvim" })

	-- NvimTree
	use("nvim-tree/nvim-web-devicons")
	use("nvim-tree/nvim-tree.lua")

	-- Bufferline stuff
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")

	-- ToggleTerm
	use("akinsho/toggleterm.nvim")

	use("lukas-reineke/indent-blankline.nvim")
	use("ahmedkhalf/project.nvim")

	-- Bufferline
	use("freddiehaddad/feline.nvim")

	-- Which Key
	use("folke/which-key.nvim")

	-- DAP, who knows where this will go
	use("mfussenegger/nvim-dap")
	use("jedrzejboczar/nvim-dap-cortex-debug") -- Cortex ARM Debug
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } })

	-- Some VSCODE bullshittery
	use({
		"EthanJWright/vs-tasks.nvim",
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			{
				"Joakker/lua-json5",
				run = "./install.sh",
			},
		},
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
