require("lspconfig").jsonls.setup({
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  init_options = {
    provideFormatter = true,
  },
  root_dir = function()
    return vim.loop.cwd()
  end,
})
