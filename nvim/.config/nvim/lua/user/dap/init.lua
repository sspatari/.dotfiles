local telescope_status_ok, telescope = pcall(require, "telescope")
local dapui_status_ok, dapui = pcall(require, "dapui")
local dap_status_ok, dap = pcall(require, "dap")
local dap_vt_status_ok, dap_vt = pcall(require, "nvim-dap-virtual-text")

if not telescope_status_ok or not dapui_status_ok or not dap_status_ok or not dap_vt_status_ok then
  return
end

telescope.load_extension("dap")

dap_vt.setup()
dapui.setup()

-- ╭──────────────────────────────────────────────────────────╮
-- │ DAP Setup                                                │
-- ╰──────────────────────────────────────────────────────────╯
dap.set_log_level("TRACE")

-- Automatically open UI
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Enable virtual text
vim.g.dap_virtual_text = true

-- ╭──────────────────────────────────────────────────────────╮
-- │ Icons                                                    │
-- ╰──────────────────────────────────────────────────────────╯
vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })

require("user.dap.go").setup()
require("user.dap.javascript").setup()
