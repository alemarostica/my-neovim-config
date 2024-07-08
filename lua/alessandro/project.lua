local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
	print("project-nvim did not initialize")
	return
end

project.setup {
  show_hidden = true,
  silent_chdir = false,
}
