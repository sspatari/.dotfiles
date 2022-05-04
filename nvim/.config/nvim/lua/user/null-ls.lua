local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
  sources = {
    formatting.prettier.with({
      filetypes = { "graphql", "markdown", "yaml" },
    }),
    formatting.stylua,
  },
})
