-- require all language server modules
require("user.lsp.typescript")
require("user.lsp.eslint")
require("user.lsp.vue")
require("user.lsp.css")
require("user.lsp.html")
require("user.lsp.luals")
require("user.lsp.python")
require("user.lsp.json")
require("user.lsp.tailwind")
require("user.lsp.yaml")
require("user.lsp.prisma")
require("user.lsp.emmet")
require("user.lsp.gql")
require("user.lsp.rust")

-- Customization and appearance -----------------------------------------
-- change gutter diagnostic symbols
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = {
    source = "if_many",
    prefix = " ", -- Could be '●', '▎', 'x'
  },
  float = {
    source = "always",
  },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})
