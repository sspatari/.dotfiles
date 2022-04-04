local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Open explorer
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Visual mode --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Normal mode --
-- Move text up and down
keymap("n", "<C-j>", ":m .+1<CR>==", opts)
keymap("n", "<C-k>", ":m .-2<CR>==", opts)

-- Visual mode --
-- Move text up and down
keymap("v", "<C-j>", ":move '>+1<CR>gv-gv", opts)
keymap("v", "<C-k>", ":move '<-2<CR>gv-gv", opts)
keymap("v", "p", '"_dP', opts)

-- Insert mode --
-- Move text up and down
keymap("i", "<C-j>", "<ESC>:m .+1<CR>==gi", opts)
keymap("i", "<C-k>", "<ESC>:m .-2<CR>==gi", opts)
