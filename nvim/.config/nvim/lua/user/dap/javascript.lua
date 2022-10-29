local DEBUGGER_PATH = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter"

local M = {}

function M.setup()
  local dap_vscode_js_status_ok, dap_vscode_js = pcall(require, "dap-vscode-js")
  local dap_status_ok, dap = pcall(require, "dap")
  if not dap_vscode_js_status_ok or not dap_status_ok then
    vim.notify("dap-vscode-js or dap not found!")
    return
  end

  dap_vscode_js.setup({
    node_path = "node",
    debugger_path = DEBUGGER_PATH,
    -- debugger_cmd = { "js-debug-adapter" },
    adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
  })

  for _, language in ipairs({ "typescript", "javascript" }) do
    dap.configurations[language] = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "launch",
        name = "Debug Jest Tests",
        -- trace = true, -- include debugger info
        runtimeExecutable = "node",
        runtimeArgs = {
          "./node_modules/jest/bin/jest.js",
          "--runInBand",
        },
        rootPath = "${workspaceFolder}",
        cwd = "${workspaceFolder}",
        console = "integratedTerminal",
        internalConsoleOptions = "neverOpen",
      },
    }
  end
end

return M
