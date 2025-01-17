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

-- This module contains a number of default definitions
local status_ok, rainbow_delimiters = pcall(require, "rainbow-delimiters")
if not status_ok then
	print("rainbow_delimiters did not initialize")
	return
end

---@type rainbow_delimiters.config
vim.g.rainbow_delimiters = {
	strategy = {
		[""] = rainbow_delimiters.strategy["global"],
		vim = rainbow_delimiters.strategy["local"],
	},
	query = {
		[""] = "rainbow-delimiters",
		lua = "rainbow-blocks",
	},
	priority = {
		[""] = 110,
		lua = 210,
	},
	highlight = {
		"RainbowDelimiterBlue",
		"RainbowDelimiterGreen",
		"RainbowDelimiterCyan",
		"RainbowDelimiterViolet",
		"RainbowDelimiterYellow",
		"RainbowDelimiterOrange",
		"RainbowDelimiterRed",
	},
}
