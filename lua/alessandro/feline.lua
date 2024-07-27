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

local status_ok, feline = pcall(require, "feline")
if not status_ok then
  print("feline did not initialize")
  return
end

-- Colors of the moonfly theme, definetely not all of them are needed
local colorscheme = {
  black = "#202020",
  bg = "#1b1b1b",
  white = "#ffffff",
  yellow = "#e3c78a",
  orange = "#de935f",
  green = "#8cc85f",
  oceanblue = "#2e2e2e", -- Momentarily overridden with gray until I learn to properly config feline
  violet = "#cf87e8",
  red = "#ff5454",
  cyan = "#79dac8",
  skyblue = "#74b2ff",
  fg = "#d0d0d0",
  magenta = "#ae81ff",
}

feline.setup()
feline.use_theme(colorscheme)
