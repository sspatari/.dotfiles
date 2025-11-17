return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason_status_ok, mason = pcall(require, "mason")
    local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
    if not mason_status_ok or not mason_lspconfig_status_ok then
      return
    end

    mason.setup({
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
      ensure_installed = {
        "roslyn"
      },
    })
    mason_lspconfig.setup({
      ensure_installed = {
        "eslint",
        "graphql",
        "html",
        "jsonls",
        "lua_ls",
        "prismals",
        "pyright",
        "rust_analyzer",
        "tailwindcss",
        "ts_ls",
        "yamlls"
      },
    })
  end,
}
