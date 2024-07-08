vim.cmd [[
  try
    colorscheme flexoki-dark
    catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]
