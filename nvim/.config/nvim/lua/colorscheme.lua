local colorscheme = "catppuccin"

require("catppuccin").setup({
  show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
  dim_inactive = {
    enabled = true, -- dims the background color of inactive window
    shade = "dark",
    percentage = 0.01, -- percentage of the shade to apply to the inactive window
  },
})

local status_ok, _ = pcall(vim.api.nvim_command, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
