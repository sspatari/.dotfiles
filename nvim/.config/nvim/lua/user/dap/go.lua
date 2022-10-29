local M = {}

function M.setup()
  local dap_go_status_ok, dap_go = pcall(require, "dap-go")
  if not dap_go_status_ok then
    vim.notify("dap-go not found!")
    return
  end

  dap_go.setup()
end

return M
