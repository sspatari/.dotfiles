local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup({
  sections = {
    lualine_c = { { "filename", file_status = true, path = 1, shorting_target = 60 } },
  },
  inactive_sections = {
    lualine_c = { { "filename", file_status = true, path = 1 } },
  },
  extensions = { "fugitive", "nvim-tree" },
})
