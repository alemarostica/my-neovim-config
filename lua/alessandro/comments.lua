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

local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  print "Comment did not initialize"
  return
end

comment.setup {
  toggler = {
    -- Line comment toggler
    line = 'glc',
    -- Block comment toggler
    block = 'gbc',
  },
  opleader = {
    -- Line comment keymap
    line = 'gl',
    -- Block comment keymap
    block = 'gb',
  },
  extra = {
    -- Add comment line above
    above = 'gla',
    -- Add comment line below
    below = 'glb',
    -- Add comment line at end of line
    eol = 'gle',
  },
  pre_hook = function (ctx)
    local U = require("Comment.utils")
    
    local tscc_status_ok, tscc = pcall(require, "ts_context_commentstring")
    if not tscc_status_ok then
      print "ts_context_commentstring did not initialize"
      return
    end

    tscc.setup {
      enable = true,
      enable_autocmd = false,
    }

    local status_utils_ok, utils = pcall(require, "ts_context_commentstring.utils")
    if not status_utils_ok then
      print "ts_context_commentstring.utils did not initialize"
      return
    end

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = utils.get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = utils.get_visual_start_location()
    end

    local status_internals_ok, internals = pcall(require, "ts_context_commentstring.internals")
    if not status_internals_ok then
      print "ts_context_commentstring.internals did not initialize"
      return
    end

    return internals.calculate_commentstring {
      key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
      location = location,
    }
  end,
}
