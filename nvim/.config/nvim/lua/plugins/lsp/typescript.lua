local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local on_attach = function(client)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  local ts_utils_status_ok, ts_utils = pcall(require, "nvim-lsp-ts-utils")
  if not ts_utils_status_ok then
    return
  end

  ts_utils.setup({
    filter_out_diagnostics_by_code = { 80001 },
  })
  ts_utils.setup_client(client)
end

local function filter(arr, fn)
  if type(arr) ~= "table" then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function filterReactDTS(value)
  return string.match(value.targetUri or value.uri, "react/index.d.ts") == nil
end

lspconfig.ts_ls.setup({
  on_attach = on_attach,
  -- other options
  handlers = {
    ["textDocument/definition"] = function(err, result, method, ...)
      if vim.islist(result) and #result > 1 then
        local filtered_result = filter(result, filterReactDTS)
        return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
      end

      vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
    end,
  },
})
