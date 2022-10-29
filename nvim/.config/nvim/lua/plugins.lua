local fn = vim.fn

local function get_config(name)
  return string.format('require("user/%s")', name)
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
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use({
      "neovim/nvim-lspconfig",
      -- the 2 lines below are used to filter anoying 'file is a commonjs module
      -- it can be converted to an ES module' warning
      wants = { "nvim-lsp-ts-utils" },
      requires = { "jose-elias-alvarez/nvim-lsp-ts-utils" },
      config = get_config("lsp"),
    }) -- enable LSP
    use({ "jose-elias-alvarez/null-ls.nvim", config = get_config("null-ls") }) -- for formatters and linters

    -- Telescope
    use({
      "nvim-telescope/telescope.nvim",
      requires = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      },
      config = get_config("telescope"),
    })

    -- Treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      requires = {
        "p00f/nvim-ts-rainbow",
      },
      run = ":TSUpdate",
      config = get_config("treesitter"),
    })

    -- LuaLine
    use({
      "hoob3rt/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = get_config("lualine"),
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
      config = get_config("cmp"),
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
    use("tpope/vim-rhubarb")
    use({ "lewis6991/gitsigns.nvim", config = get_config("gitsigns") })

    -- Commenting
    use({
      "numToStr/Comment.nvim",
      requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
      config = get_config("comment"),
    })

    -- windwp
    use("windwp/nvim-ts-autotag") -- auto close and rename tags
    use({
      "windwp/nvim-autopairs",
      requires = { "hrsh7th/nvim-cmp" },
      config = get_config("autopairs"),
    })

    -- hightlight matching tag in html,jsx etc.
    use({ "leafOfTree/vim-matchtag", config = get_config("matchtag") })

    -- motions on speed
    use({ "phaazon/hop.nvim", config = get_config("hop") })

    -- file tree
    use({
      "kyazdani42/nvim-tree.lua",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = get_config("nvim-tree"),
    })

    -- icons in completion
    use({ "onsails/lspkind-nvim", config = get_config("lspkind") })

    -- Todo comments
    use({
      "folke/todo-comments.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = get_config("todo-comments"),
    })

    -- better code action menu
    use({
      "weilbith/nvim-code-action-menu",
      cmd = "CodeActionMenu",
    })

    -- Debugger
    use({
      "mfussenegger/nvim-dap",
      requires = {
        { "Pocco81/DAPInstall.nvim", branch = "dev" },
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/nvim-dap-ui",
        "nvim-telescope/telescope-dap.nvim",
        -- { "leoluz/nvim-dap-go", module = "dap-go" },
      },
      config = get_config("dap"),
    })

    use({
      "nvim-neotest/neotest",
      opt = true,
      wants = {
        "plenary.nvim",
        "nvim-treesitter",
        "FixCursorHold.nvim",
        "neotest-plenary",
        "neotest-go",
        "neotest-jest",
      },
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-plenary",
        "nvim-neotest/neotest-go",
        "haydenmeade/neotest-jest",
      },
      module = { "neotest" },
      config = get_config("neotest"),
    })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end,
})
