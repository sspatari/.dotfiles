return {
  "stevearc/conform.nvim",
  config = function()
    local ok, conform = pcall(require, "conform")
    if not ok then
      return
    end

    local function goimports_cmd()
      -- Find go.mod upwards from current buffer dir
      local buf_dir = vim.fn.expand("%:p:h")
      local gomod = vim.fn.findfile("go.mod", buf_dir .. ";")
      if gomod ~= "" then
        local root = vim.fn.fnamemodify(gomod, ":h")
        local local_goimports = root .. "/.bin/goimports"
        if vim.fn.filereadable(local_goimports) == 1 then
          return local_goimports
        end
      end
      -- fallback to global
      return "goimports"
    end

    conform.setup({
      formatters_by_ft = {
        go = { "goimports", "gofmt", stop_after_first = true },
      },
      formatters = {
        goimports = {
          command = goimports_cmd,
        },
      },
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
      },
    })
  end,
}
