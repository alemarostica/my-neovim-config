-- local status_ok, dap = pcall(require, "nvim-dap")
-- if not status_ok then
--   print "nvim-dap did not initialize"
--   return 0
-- end

local status_ok, cortex_debug = pcall(require, "dap-cortex-debug")
if not status_ok then
	print("dap-cortex-debug did not initialize")
	return 0
end

cortex_debug.setup()

require("dap").configurations.c = {
	cortex_debug.openocd_config({
		name = "Example debugging with OpenOCD",
		cwd = "${workspaceFolder}",
		executable = "${workspaceFolder}/build/app",
		configFiles = { "${workspaceFolder}/build/openocd/connect.cfg" },
		gdbTarget = "localhost:3333",
		rttConfig = cortex_debug.rtt_config(0),
		showDevDebugOutput = false,
	}),
}
