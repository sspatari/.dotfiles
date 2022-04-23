-- most of this is default settings
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim" -- add this value
    },
    layout_strategy = "vertical",
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    -- file_ignore_patterns = { ".git/", "node_modules/", "env/" }, -- ignore git
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
  },
})
