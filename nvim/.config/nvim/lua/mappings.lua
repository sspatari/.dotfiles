local function register_mappings(mappings, default_options)
  for mode, mode_mappings in pairs(mappings) do
    for _, mapping in pairs(mode_mappings) do
      local options = #mapping == 3 and table.remove(mapping) or default_options
      local prefix, cmd = unpack(mapping)
      pcall(vim.api.nvim_set_keymap, mode, prefix, cmd, options)
    end
  end
end

local mappings = {
  i = {
    -- terminal window navigation
    { "<C-h>", "<C-\\><C-N><C-w>h" },
    { "<C-j>", "<C-\\><C-N><C-w>j" },
    { "<C-l>", "<C-\\><C-N><C-w>l" },
    { "<C-k>", "<C-\\><C-N><C-w>k" },

    -- moving text
    { "∆", "<ESC>:m .+1<CR>==gi" }, -- <Option-j>
    { "˚", "<ESC>:m .-2<CR>==gi" }, -- <Option-k>
  },
  n = {
    -- better window movement
    { "<C-h>", "<C-w>h", { silent = true } },
    { "<C-j>", "<C-w>j", { silent = true } },
    { "<C-k>", "<C-w>k", { silent = true } },
    { "<C-l>", "<C-w>l", { silent = true } },

    -- resize with arrows
    { "<C-Up>", ":resize -2<CR>", { silent = true } },
    { "<C-Down>", ":resize +2<CR>", { silent = true } },
    { "<C-Left>", ":vertical resize -2<CR>", { silent = true } },
    { "<C-Right>", ":vertical resize +2<CR>", { silent = true } },

    -- escape clears highlighting
    { "<ESC>", ":noh<CR><ESC>" },

    -- hop
    { "<leader>hw", ":HopWord<CR>" },
    { "<leader>hl", ":HopLine<CR>" },
    { "<leader>hc", "<CMD>lua require'hop'.hint_char1()<CR>" },
    { "<leader>hd", "<CMD>lua require'hop'.hint_char2()<CR>" },
    { "<leader>hp", "<CMD>lua require'hop'.hint_patterns()<CR>" },

    -- lsp
    { "K", "<CMD>lua vim.lsp.buf.hover()<CR>" },
    { "<C-k>", "<CMD>lua vim.lsp.buf.signature_help()<CR>" },
    { "[d", "<CMD>lua vim.diagnostic.goto_prev({ float = { border = 'rounded' }})<CR>" },
    { "]d", "<CMD>lua vim.diagnostic.goto_next({ float = { border = 'rounded' }})<CR>" },
    { "<leader>d", "<CMD>lua vim.diagnostic.open_float({ border = 'rounded' })<CR>" }, --"Line Diagnostics"
    { "<leader>ld", "<CMD>lua vim.diagnostic.open_float({ border = 'rounded' })<CR>" }, --"Line Diagnostics"
    { "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>" },
    { "gd", "<CMD>lua vim.lsp.buf.definition()<CR>" },
    { "gr", "<CMD>lua vim.lsp.buf.references()<CR>" },
    { "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>" },
    { "<leader>r", "<CMD>lua vim.lsp.buf.rename()<CR>" }, --"Rename"
    { "<leader>lf", "<CMD>lua vim.lsp.buf.formatting()<CR>" }, --"Format File"
    { "<leader>lr", "<CMD>lua vim.lsp.buf.rename()<CR>" }, --"Rename"
    { "<leader>lR", "<CMD>lua vim.lsp.buf.references()<CR>" }, --"List references"
    { "<leader>lc", "<CMD>lua vim.lsp.buf.code_action()<CR>" }, --"Code actions"

    -- general
    { "<leader>e", ":NvimTreeToggle<CR>" }, --"File Tree"
    { "<leader>T", ":TodoLocList<CR>" }, --"Todos list"
    { "<leader>c", ":CodeActionMenu<CR>" }, --"Code Actions"

    -- telescope
    { "<leader>ff", ":Telescope find_files<CR>" }, --"Find File"
    { "<leader>fb", ":Telescope buffers<CR>" }, --"Find Buffer"
    { "<leader>fn", ":TodoTelescope<CR>" }, --"Find Notes"
    { "<leader>ft", ":Telescope builtin<CR>" }, --"Telescope builtin"
    { "<leader>fs", ":Telescope live_grep<CR>" }, --"Search In Files"
    { "<leader>fw", ":Telescope grep_string<CR>" }, --"Search word under cursor"
    { "<leader>fc", ":Telescope lsp_code_actions<CR>" }, --"Code Actions"
    { "<leader>fr", ":Telescope lsp_references<CR>" }, --"Find References"
    { "<leader>fd", ":Telescope diagnostics<CR>" }, --"Document Diagnostics"
    { "<leader>fm", ":Telescope marks<CR>" }, --"Marks"
    { "<leader>fk", ":Telescope keymaps<CR>" }, --"Key mappings"
    { "<leader>fM", ":Telescope man_pages<CR>" }, --"Man pages"
    { "<leader>fg", ":Telescope git_files<CR>" }, --"Find Git Files"

    -- debug
    { "<leader>DR", "<CMD>lua require'dap'.run_to_cursor()<CR>" }, --"Run to Cursor"
    { "<leader>DE", "<CMD>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<CR>" }, --"Evaluate Input"
    { "<leader>DC", "<CMD>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<CR>" }, --"Conditional Breakpoint"
    { "<leader>DU", "<CMD>lua require'dapui'.toggle()<CR>" }, --"Toggle UI"
    { "<leader>Db", "<CMD>lua require'dap'.step_back()<CR>" }, --"Step Back"
    { "<leader>Dc", "<CMD>lua require'dap'.continue()<CR>" }, --"Continue"
    { "<leader>Dd", "<CMD>lua require'dap'.disconnect()<CR>" }, --"Disconnect"
    { "<leader>De", "<CMD>lua require'dapui'.eval()<CR>" }, --"Evaluate"
    { "<leader>Dg", "<CMD>lua require'dap'.session()<CR>" }, --"Get Session"
    { "<leader>Dh", "<CMD>lua require'dap.ui.widgets'.hover()<CR>" }, --"Hover Variables"
    { "<leader>DS", "<CMD>lua require'dap.ui.widgets'.scopes()<CR>" }, --"Scopes"
    { "<leader>Di", "<CMD>lua require'dap'.step_into()<CR>" }, --"Step Into"
    { "<leader>Do", "<CMD>lua require'dap'.step_over()<CR>" }, --"Step Over"
    { "<leader>Dp", "<CMD>lua require'dap'.pause.toggle()<CR>" }, --"Pause"
    { "<leader>Dq", "<CMD>lua require'dap'.close()<CR>" }, --"Quit"
    { "<leader>Dr", "<CMD>lua require'dap'.repl.toggle()<CR>" }, --"Toggle Repl"
    { "<leader>Ds", "<CMD>lua require'dap'.continue()<CR>" }, --"Start"
    { "<leader>Dt", "<CMD>lua require'dap'.toggle_breakpoint()<CR>" }, --"Toggle Breakpoint"
    { "<leader>Dx", "<CMD>lua require'dap'.terminate()<CR>" }, --"Terminate"
    { "<leader>Du", "<CMD>lua require'dap'.step_out()<CR>" }, --"Step Out"

    -- neotest
    { "<leader>na", "<CMD>lua require('neotest').run.attach()<CR>" }, --"Attach"
    { "<leader>nf", "<CMD>lua require('neotest').run.run(vim.fn.expand('%'))<CR>" }, --"Run File"
    { "<leader>nF", "<CMD>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<CR>" }, --"Debug File"
    { "<leader>nl", "<CMD>lua require('neotest').run.run_last()<CR>" }, --"Run Last"
    { "<leader>nL", "<CMD>lua require('neotest').run.run_last({ strategy = 'dap' })<CR>" }, --"Debug Last"
    { "<leader>nn", "<CMD>lua require('neotest').run.run()<CR>" }, --"Run Nearest"
    { "<leader>nN", "<CMD>lua require('neotest').run.run({strategy = 'dap'})<CR>" }, --"Debug Nearest"
    { "<leader>no", "<CMD>lua require('neotest').output.open({ enter = true })<CR>" }, --"Output"
    { "<leader>nS", "<CMD>lua require('neotest').run.stop()<CR>" }, --"Stop"
    { "<leader>ns", "<CMD>lua require('neotest').summary.toggle()<CR>" }, --"Summary"
  },
  t = {
    -- terminal window navigation
    { "<C-h>", "<C-\\><C-N><C-w>h" },
    { "<C-j>", "<C-\\><C-N><C-w>j" },
    { "<C-k>", "<C-\\><C-N><C-w>k" },
    { "<C-l>", "<C-\\><C-N><C-w>l" },

    -- map escape to normal mode in terminal
    { "<Esc>", [[ <C-\><C-n> ]] },
    { "jj", [[ <C-\><C-n> ]] },
  },
  v = {
    -- better indenting
    { "<", "<gv" },
    { ">", ">gv" },

    -- moving text
    { "∆", ":m '>+1<CR>gv=gv" }, -- <Option-j>
    { "˚", ":m '<-2<CR>gv=gv" }, -- <Option-k>
  },
  x = {},
}

register_mappings(mappings, { silent = true, noremap = true })
