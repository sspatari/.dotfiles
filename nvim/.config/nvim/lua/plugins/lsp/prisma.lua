vim.lsp.config("prismals", {
  root_dir = function()
    ---@diagnostic disable-next-line: undefined-field
    return vim.uv.cwd()
  end,
})
vim.lsp.enable("prismals")
