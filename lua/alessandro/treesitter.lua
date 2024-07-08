local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  print "treesitter did not initialize"
  return
end

configs.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsed with maintainers). or a list of languages
  sync_install = false, -- install languages synchronously (only applied to 'ensure_installed')
  ignore_install = { "" }, -- list of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of languages that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } }
}