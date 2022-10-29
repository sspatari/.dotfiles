require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "eslint",
    "graphql",
    "html",
    "jsonls",
    "sumneko_lua",
    "prismals",
    "pyright",
    "rust_analyzer",
    "tailwindcss",
    "tsserver",
    "yamlls",
  },
})
