local function go_organize_imports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = { only = { "source.organizeImports" } }
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for cid, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
        vim.lsp.util.apply_workspace_edit(r.edit, enc)
      end
    end
  end
end

vim.api.nvim_create_user_command("Format", function()
  vim.lsp.buf.formatting()
end, {})

local formatOnSaveGroup = "format_on_save"
vim.api.nvim_create_augroup(formatOnSaveGroup, { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  group = formatOnSaveGroup,
  desc = "Run formatter",
  callback = function()
    vim.lsp.buf.formatting_sync()
  end,
})

local goOrgImportsGroup = "go_organize_imports"
vim.api.nvim_create_augroup(goOrgImportsGroup, { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go" },
  group = goOrgImportsGroup,
  desc = "Organize imports",
  callback = function()
    go_organize_imports(3000)
  end,
})

local highlight_yank = "highlight_yank"
vim.api.nvim_create_augroup(highlight_yank, { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = highlight_yank,
  desc = "Highlight on yank",
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})
