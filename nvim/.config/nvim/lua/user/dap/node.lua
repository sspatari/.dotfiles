local dap = require("dap")

dap.configurations.typescript = {
  {
    name = "Run",
    type = "node2",
    request = "launch",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal",
    outFiles = { "${workspaceFolder}/dist/**/*.js" },
  },
  {
    name = "Attach to process",
    type = "node2",
    request = "attach",
    processId = require("dap.utils").pick_process,
  },
}
