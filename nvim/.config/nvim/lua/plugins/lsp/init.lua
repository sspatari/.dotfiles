return {
  "neovim/nvim-lspconfig",
  dependencies = { "jose-elias-alvarez/nvim-lsp-ts-utils" },
  config = function()
    -- require all language server modules
    require("plugins.lsp.gopls")
    require("plugins.lsp.typescript")
    require("plugins.lsp.eslint")
    require("plugins.lsp.css")
    require("plugins.lsp.html")
    require("plugins.lsp.luals")
    require("plugins.lsp.python")
    require("plugins.lsp.json")
    require("plugins.lsp.tailwind")
    require("plugins.lsp.yaml")
    require("plugins.lsp.prisma")
    require("plugins.lsp.gql")
    require("plugins.lsp.rust")
    require("plugins.lsp.taplo")

    -- Customization and appearance -----------------------------------------
    vim.diagnostic.config({
      virtual_text = {
        source = "if_many",
        prefix = " ", -- Could be '●', '▎', 'x'
      },
      float = {
        source = true,
      },
      -- customize signs for diagnostics in the gutter
         signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.INFO] = " ",
          [vim.diagnostic.severity.HINT] = " ",
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
          [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
          [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
          [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
        },
      },
    })
  end,
}
