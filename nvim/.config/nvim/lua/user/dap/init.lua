local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
  return
end

local dap_install_status_ok, dap_install = pcall(require, "dap-install")
if not dap_install_status_ok then
  return
end

local dapui_status_ok, dapui = pcall(require, "dapui")
if not dapui_status_ok then
  return
end

local dap_vt_status_ok, dap_vt = pcall(require, "nvim-dap-virtual-text")
if not dap_vt_status_ok then
  return
end

telescope.load_extension("dap")

dap_install.config("go_delve", {})
dap_install.config("jsnode", {})
dap_install.config("chrome", {})

require("user.dap.node")

dap_vt.setup()
dapui.setup()
