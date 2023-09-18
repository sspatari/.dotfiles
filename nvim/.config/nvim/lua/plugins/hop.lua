return {
  -- motions on speed
  "phaazon/hop.nvim",
  config = function()
    local status_ok, hop = pcall(require, "hop")
    if not status_ok then
      return
    end

    hop.setup({ keys = "etovxqpdygfblzhckisuran" })
  end,
}
