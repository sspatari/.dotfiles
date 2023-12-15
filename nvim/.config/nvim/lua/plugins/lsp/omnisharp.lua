local pid = vim.fn.getpid()
local omnisharpPath = "/Users/stanislavspatari/.local/share/nvim/mason/bin/omnisharp"
require("lspconfig").omnisharp.setup({
  cmd = { omnisharpPath, "--languageserver", "--hostPID", tostring(pid) },
  handlers = {
    ["textDocument/definition"] = require("omnisharp_extended").handler,
  },
})
