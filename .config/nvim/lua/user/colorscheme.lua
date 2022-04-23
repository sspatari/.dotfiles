local colorscheme = "tokyonight"

vim.g.tokyonight_style = "night"
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_dark_float = false

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
