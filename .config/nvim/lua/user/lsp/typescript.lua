local on_attach = function(client)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
end

require("lspconfig").tsserver.setup({
  on_attach = on_attach
})
