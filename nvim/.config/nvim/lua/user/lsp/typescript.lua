local on_attach = function(client)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  local status_ok, ts_utils = pcall(require, "nvim-lsp-ts-utils")
  if not status_ok then
    return
  end

  ts_utils.setup({
    filter_out_diagnostics_by_code = { 80001 },
  })
  ts_utils.setup_client(client)
end

require("lspconfig").tsserver.setup({
  on_attach = on_attach,
})
