return {
  "sindrets/diffview.nvim",
  config = function()
    local status_ok, diffview = pcall(require, "diffview")
    if not status_ok then
      return
    end

    diffview.setup()
  end,
}
