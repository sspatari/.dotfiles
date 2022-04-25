local on_attach = function(client)
  client.resolved_capabilities.document_formatting = true
  client.resolved_capabilities.document_range_formatting = true
end


require("lspconfig").eslint.setup({
  on_attach = on_attach
})
