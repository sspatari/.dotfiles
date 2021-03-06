local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

wk.setup({
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {},
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    -- winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  show_help = true, -- show help message on the command line when the popup is visible
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
})

-- register key bindings with <leader> prefix
wk.register({
  f = {
    -- mostly Telescope bindings
    name = "Find with Telescope",
    f = { ":Telescope find_files<CR>", "Find File" },
    b = { ":Telescope buffers<CR>", "Find Buffer" },
    n = { ":TodoTelescope<CR>", "Find Notes" },
    t = { ":Telescope builtin<CR>", "Telescope builtin" },
    s = { ":Telescope live_grep<CR>", "Search In Files" },
    w = { ":Telescope grep_string<CR>", "Search word under cursor" },
    c = { ":Telescope lsp_code_actions<CR>", "Code Actions" },
    r = { ":Telescope lsp_references<CR>", "Find References" },
    d = { ":Telescope diagnostics<CR>", "Document Diagnostics" },
    m = { ":Telescope marks<CR>", "Marks" },
    k = { ":Telescope keymaps<CR>", "Key mappings" },
    M = { ":Telescope man_pages<CR>", "Man pages" },
    g = { ":Telescope git_files<CR>", "Find Git Files" },
  },
  h = {
    name = "Git Gutter",
    p = "Preview Hunk",
    s = "Stage Hunk",
    u = "Undo Changes",
  },
  e = { ":NvimTreeToggle<CR>", "File Tree" },
  T = { ":TodoLocList<CR>", "Todos list" },
  c = { ":CodeActionMenu<CR>", "Code Actions" },
  d = { "<cmd>lua vim.diagnostic.open_float({ border = 'rounded' })<CR>", "Line Diagnostics" },
  w = { ":WhichKey<CR>", "WhichKey" },
  s = { ":lua vim.o.spell = not vim.o.spell<CR>", "Toggle spell check" },
  r = { ":lua vim.lsp.buf.rename()<CR>", "Rename" },
  l = {
    name = "LSP",
    f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format File" },
    d = { "<cmd>lua vim.diagnostic.open_float({ border = 'rounded' })<CR>", "Line Diagnostics" },
    r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    R = { "<cmd>lua vim.lsp.buf.references()<CR>", "List references" },
    c = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code actions" },
  },
  D = {
    name = "Debug",
    R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
    E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
    C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
    U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
    b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
    g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
    S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
    q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
    t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
    u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
  },
}, {
  prefix = "<leader>",
})

wk.register({
  name = "Go to",
  d = "Definition",
  D = "Declaration",
  r = "References",
}, { prefix = "g" })
