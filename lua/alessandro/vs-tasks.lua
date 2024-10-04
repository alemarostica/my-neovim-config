local status_ok, vs_tasks = pcall(require, "vstask")
if not status_ok then
  print("vstask did not initialize")
  return 0
end

vs_tasks.setup({
  json_parser = require("json5").parse,
  terminal = 'toggleterm',
})
