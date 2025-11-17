return {
  "tpope/vim-surround", -- All about surroundings

  -- Colorschemes
  "folke/tokyonight.nvim",
  "Mofiqul/dracula.nvim",
  "morhetz/gruvbox",
  { "catppuccin/nvim", name = "catppuccin" },
  "navarasu/onedark.nvim",

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },

  -- Git
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- auto close and rename tags
  "windwp/nvim-ts-autotag",

  -- Highlight the word under the cursor
  "RRethy/vim-illuminate",
  {
    "seblyng/roslyn.nvim",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    ft = { "cs", "razor" },
    opts = {
      -- your configuration comes here; leave empty for default settings
    },
  }
}
