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
keymap("n", "∆", ":m .+1<CR>==", opts) -- "<M-j>"
keymap("n", "˚", ":m .-2<CR>==", opts) -- "<M-j>"

-- Visual mode --
-- Move text up and down
keymap("v", "∆", ":move '>+1<CR>gv-gv", opts) -- "<M-j>"
keymap("v", "˚", ":move '<-2<CR>gv-gv", opts) -- "<M-k>"
keymap("v", "p", '"_dP', opts)

-- Insert mode --
-- Move text up and down
keymap("i", "∆", "<ESC>:m .+1<CR>==gi", opts) -- "<M-j>"
keymap("i", "˚", "<ESC>:m .-2<CR>==gi", opts) -- "<M-k>"
