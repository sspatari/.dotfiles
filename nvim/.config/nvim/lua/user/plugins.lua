local fn = vim.fn

local function get_setup(name)
  return string.format('require("lua/user/%s")', name)
end

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup({
  function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    use("tpope/vim-surround") -- All about surroundings

    -- Colorschemes
    use("folke/tokyonight.nvim")
    use("Mofiqul/dracula.nvim")
    use("morhetz/gruvbox")

    -- LSP
    use("neovim/nvim-lspconfig") -- enable LSP
    use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

    -- Telescope
    use({
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

    -- Treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    })
    use("p00f/nvim-ts-rainbow")

    -- LuaLine
    use({
      "hoob3rt/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    -- Autocomplete
    use({
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-cmdline", -- command line
        "hrsh7th/cmp-buffer", -- buffer completions
        "hrsh7th/cmp-nvim-lua", -- nvim config completions
        "hrsh7th/cmp-nvim-lsp", -- lsp completions
        "hrsh7th/cmp-path", -- file path completions
        "saadparwaiz1/cmp_luasnip", -- snippets completions
      },
    })

    -- Snippets
    use({
      "L3MON4D3/LuaSnip",
      requires = {
        "rafamadriz/friendly-snippets",
      },
    })

    -- Git
    use("tpope/vim-fugitive")
    use("lewis6991/gitsigns.nvim")

    -- Commenting
    use("JoosepAlviste/nvim-ts-context-commentstring")
    use("numToStr/Comment.nvim")

    -- windwp
    use("windwp/nvim-ts-autotag") -- auto close and rename tags
    use("windwp/nvim-autopairs")

    -- hightlight matching tag in html,jsx etc.
    use("leafOfTree/vim-matchtag")

    -- motions on speed
    use("phaazon/hop.nvim")

    -- file tree
    use({
      "kyazdani42/nvim-tree.lua",
      requires = { "kyazdani42/nvim-web-devicons" },
    })

    -- icons in completion
    use("onsails/lspkind-nvim")

    -- WhichKey
    use("folke/which-key.nvim")

    -- Todo comments
    use({
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
    })

    -- better code action menu
    use({
      "weilbith/nvim-code-action-menu",
      cmd = "CodeActionMenu",
    })

    use({ "lukas-reineke/indent-blankline.nvim", config = get_setup("indent-blankline") })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end,
})
