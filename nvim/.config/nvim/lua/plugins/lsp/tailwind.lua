local root_pattern = require("lspconfig").util.root_pattern

vim.lsp.config("tailwindcss", {
  root_dir = root_pattern("tailwind.config.js", "tailwind.config.ts", "postcss.config.js", "postcss.config.ts"),
})
vim.lsp.enable("tailwindcss")
