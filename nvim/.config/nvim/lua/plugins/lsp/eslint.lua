local on_attach = function(client)
  client.server_capabilities.documentFormattingProvider = true
  client.server_capabilities.documentRangeFormattingProvider = true
end

require("lspconfig").eslint.setup({
  on_attach = on_attach,
})
