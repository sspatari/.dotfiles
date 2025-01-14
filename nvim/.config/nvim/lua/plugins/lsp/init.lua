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
    require("plugins.lsp.csharpls")
    require("plugins.lsp.taplo")

    -- Customization and appearance -----------------------------------------
    -- change gutter diagnostic symbols
    local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.diagnostic.config({
      virtual_text = {
        source = "if_many",
        prefix = " ", -- Could be '●', '▎', 'x'
      },
      float = {
        source = "always",
      },
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })
  end,
}
