local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
  disable_netrw = true,
  hijack_cursor = true,
  hijack_netrw = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = " ",
      info = " ",
      warning = " ",
      error = " ",
    },
  },
  update_focused_file = {
    enable = true,
  },
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
  },
  view = {
    hide_root_folder = true,
    mappings = {
      list = {
        { key = { "l", "<CR>" }, cb = tree_cb("edit") },
        { key = "h", cb = tree_cb("close_node") },
      },
    },
    number = false,
    relativenumber = true,
  },
  actions = {
    open_file = {
      resize_window = false,
    },
  },
})
