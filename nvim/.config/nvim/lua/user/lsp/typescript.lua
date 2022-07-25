local on_attach = function(client)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
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
  return string.match(value.uri, "react/index.d.ts") == nil
end

require("lspconfig").tsserver.setup({
  on_attach = on_attach,
  handlers = {
    ["textDocument/definition"] = function(err, result, method, ...)
      if vim.tbl_islist(result) and #result > 1 then
        local filtered_result = filter(result, filterReactDTS)
        return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
      end

      vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
    end,
  },
})
