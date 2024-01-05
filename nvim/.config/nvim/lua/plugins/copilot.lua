return {
  "github/copilot.vim",
  config = function()
    vim.keymap.set("i", "<M-l>", 'copilot#Accept("<CR>")', { --Command key + l
      expr = true,
      replace_keycodes = false,
    })
    vim.g.copilot_no_tab_map = true
  end,
}
