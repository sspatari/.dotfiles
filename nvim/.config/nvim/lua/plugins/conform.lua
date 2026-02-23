return {
  'stevearc/conform.nvim',
  config = function()
    local status_ok, conform = pcall(require, "conform")
    if not status_ok then
      return
    end

    conform.setup({
      formatters_by_ft = {
        go = { "goimports", "gofmt", stop_after_first = true },
      },
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
      },
    })
  end,
}
