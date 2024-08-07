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

local options = {
	backup = false,							                          -- creates a backup file
	clipboard = "unnamedplus",					                  -- allowd neovim to access the system clipboard
	cmdheight = 2,							                          -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect", "noinsert" },	-- mostly just for cmp
	conceallevel = 0,						                          -- so that `` is visible in markdown files
	fileencoding = "utf-8",						                    -- the encoding written to a file
	hlsearch = true,						                          -- highlight all matches on previous search pattern
	ignorecase = true,						                        -- ignore case in search patterns
	mouse = "a",							                            -- allow the mouse to be used in neovim
	pumheight = 10,							                          -- pop up menu height
	showmode = false,						                          -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2,						                          -- always show tabs
	smartcase = true,						                        	-- smart case
	smartindent = true,																		-- make indenting smarter again
	splitbelow = true,																		-- force all horizontal splits to go below current window
	splitright = true,																		-- force all vertical splits to go to the right of current window
	swapfile = false,																			-- creates a swapfile
	termguicolors = true,															    -- set term gui colors
	timeoutlen = 1000,																		-- time to wait for a mapped sequence to complete (milliseconds)
	undofile = true,																			-- enable persistend undo
	updatetime = 300,																			-- faster completion (4000ms default)
	writebackup = false,																	-- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true,																	    -- convert tabs to spaces
	shiftwidth = 2,																				-- the number of spaces inserted for each indentation
	tabstop = 2,																					-- insert 2 spaces for a tab
	cursorline = true,						                        -- highlight the current line
	number = true,							                          -- set numbered lines
	relativenumber = false,						                    -- set relative numbered lines
	numberwidth = 4,						                          -- set number column width to 2 (default 4)
	signcolumn = "yes",                     			        -- always show the sign column, otherwise it would shift the text each time
	wrap = true,      			                       	      -- display lines as one long line
	linebreak = true,                       			        -- companion to wrap, don't split words
	scrolloff = 8,    			                	            -- minimal number of screen lines to keep above and below the cursor
	sidescrolloff = 8,                       			        -- minimal number of screen columns either side of cursor if wrap is `false`
	guifont = "monospace:h17",              			        -- the font used in graphical neovim applications
	whichwrap = "bs<>[]hl",				                        -- which "horizontal" keys are allowed to travel to prev/next line
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- vim.opt.shortmess = "ilmnrx" 					              -- flags to shorten vim messages, see :help 'shortmess'
vim.opt.shortmess:append "c"						                -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append "-"						                -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" })				  -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")		-- separatet vim plugins from neovim in case vim is still in use
vim.api.nvim_set_option('updatetime', 300)

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]]                      -- TODO: doesn't seem to work

vim.g.python3_host_prog = '$HOME/.venv/bin/python3'
