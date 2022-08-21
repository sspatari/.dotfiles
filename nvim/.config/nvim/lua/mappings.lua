local function register_mappings(mappings, default_options)
  for mode, mode_mappings in pairs(mappings) do
    for _, mapping in pairs(mode_mappings) do
      local options = #mapping == 3 and table.remove(mapping) or default_options
      local prefix, cmd = unpack(mapping)
      pcall(vim.api.nvim_set_keymap, mode, prefix, cmd, options)
    end
  end
end

-- NOTE: <leader> prefixed mappings are in whichkey-settings.lua

local mappings = {
  i = {
    -- Terminal window navigation
    { "<C-h>", "<C-\\><C-N><C-w>h" },
    { "<C-j>", "<C-\\><C-N><C-w>j" },
    { "<C-l>", "<C-\\><C-N><C-w>l" },
    { "<C-k>", "<C-\\><C-N><C-w>k" },
    -- moving text
    { "∆", "<ESC>:m .+1<CR>==gi" }, -- <Option-j>
    { "˚", "<ESC>:m .-2<CR>==gi" }, -- <Option-k>
  },
  n = {
    -- Normal mode
    -- Better window movement
    { "<C-h>", "<C-w>h", { silent = true } },
    { "<C-j>", "<C-w>j", { silent = true } },
    { "<C-k>", "<C-w>k", { silent = true } },
    { "<C-l>", "<C-w>l", { silent = true } },
    -- Resize with arrows
    { "<C-Up>", ":resize -2<CR>", { silent = true } },
    { "<C-Down>", ":resize +2<CR>", { silent = true } },
    { "<C-Left>", ":vertical resize -2<CR>", { silent = true } },
    { "<C-Right>", ":vertical resize +2<CR>", { silent = true } },
    -- escape clears highlighting
    { "<ESC>", ":noh<CR><ESC>" },
    -- hop words
    { "s", ":HopWord<CR>" },
    { "S", ":HopLine<CR>" },
    -- yank to end of line on Y
    { "Y", "y$" },
    -- lsp mappings
    { "K", "<CMD>lua vim.lsp.buf.hover()<CR>" },
    { "<C-k>", "<CMD>lua vim.lsp.buf.signature_help()<CR>" },
    { "[d", "<CMD>lua vim.diagnostic.goto_prev({ float = { border = 'rounded' }})<CR>" },
    { "]d", "<CMD>lua vim.diagnostic.goto_next({ float = { border = 'rounded' }})<CR>" },
    { "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>" },
    { "gd", "<CMD>lua vim.lsp.buf.definition()<CR>" },
    { "gr", "<CMD>lua vim.lsp.buf.references()<CR>" },
    { "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>" },
  },
  t = {
    -- Terminal mode
    -- Terminal window navigation
    { "<C-h>", "<C-\\><C-N><C-w>h" },
    { "<C-j>", "<C-\\><C-N><C-w>j" },
    { "<C-k>", "<C-\\><C-N><C-w>k" },
    { "<C-l>", "<C-\\><C-N><C-w>l" },
    -- map escape to normal mode in terminal
    { "<Esc>", [[ <C-\><C-n> ]] },
    { "jj", [[ <C-\><C-n> ]] },
  },
  v = {
    -- Visual/Select mode
    -- Better indenting
    { "<", "<gv" },
    { ">", ">gv" },
    -- hop words
    { "s", "<CMD>lua require'hop'.hint_words()<CR>" },
    -- moving text
    { "∆", ":m '>+1<CR>gv=gv" }, -- <Option-j>
    { "˚", ":m '<-2<CR>gv=gv" }, -- <Option-k>
  },
  x = {},
}

register_mappings(mappings, { silent = true, noremap = true })

-- hop in motion
local actions = { "d", "c", "<", ">", "y" }
for _, a in ipairs(actions) do
  vim.api.nvim_set_keymap("n", a .. "s", a .. "<CMD>lua require'hop'.hint_char1()<CR>", {})
end
