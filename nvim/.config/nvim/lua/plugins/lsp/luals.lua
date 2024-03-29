local on_attach = function(client)
  client.server_capabilities.documentFormattingProvider = false
end

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- By default, lua-language-server doesn't have a cmd set. This is because nvim-lspconfig does not
-- make assumptions about your path. You must add the following to your init.vim or init.lua to set
-- cmd to the absolute path ($HOME and ~ are not expanded) of your unzipped and compiled lua-language-server.
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#sumneko_lua

require("lspconfig").lua_ls.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        -- For some reason havin setting this line below as the docs suggest
        -- open a quick-fix window every time you jump to a reference
        -- library = vim.api.nvim_get_runtime_file("", true),
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})
