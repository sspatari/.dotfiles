-- :help options
local options = {
  number = true,
  relativenumber = true,
  cursorline = true, -- show the cursor line
  hidden = true,
  cursorcolumn = true, -- show the cursor column
  mouse = "a", -- enable mouse
  clipboard = "unnamedplus", -- use system clipboard
  smartindent = true,
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  tabstop = 2, -- insert 2 spaces for a tab
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  expandtab = true, -- spaces instead of tabs
  pumheight = 10, -- pop up menu height
  wrap = true,
  textwidth = 80,
  scrolloff = 10,
  incsearch = true,
  cmdheight = 2,
  showmode = false, -- use lualine status instead
  numberwidth = 5, -- wider gutter
  linebreak = true, -- don't break words on wrap
  completeopt = "menuone,noselect", -- nvim-cmp
  signcolumn = "yes", -- always show the signcolumn
  termguicolors = true,
  spelllang = "en_gb",
  mousemodel = "popup",
  -- timeout for whichkey
  timeoutlen = 500,
  undofile = true, -- enable persistent undo
  smartcase = true,
  ignorecase = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.g.mapleader = " "

vim.cmd([[set inccommand=nosplit]])

-- highlight on yank
vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank()]])

-- Vertically center document when entering insert mode
vim.cmd([[autocmd InsertEnter * norm zz]])

-- Give me some fenced codeblock goodness
vim.g.markdown_fenced_languages = {
  "html",
  "javascript",
  "javascriptreact",
  "typescript",
  "json",
  "css",
  "scss",
  "lua",
  "vim",
  "bash",
}
