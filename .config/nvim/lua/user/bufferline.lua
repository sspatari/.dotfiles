local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        -- text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
    diagnostics = "nvim_lsp",
    max_name_length = 22,
    tab_size = 22,
  },
})
