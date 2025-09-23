local on_attach = function(client)
  client.server_capabilities.documentFormattingProvider = true
  client.server_capabilities.documentRangeFormattingProvider = true
end

vim.lsp.config("eslint", {
  on_attach = on_attach,
})
vim.lsp.enable("eslint")
