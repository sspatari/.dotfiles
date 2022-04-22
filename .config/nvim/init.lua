-- basic settings and options
require("user.options")

-- load all the plugins
require("user.plugins")

-- set up language servers
require("user.lsp")

-- set up treesitter
require("user.treesitter")

-- configure plugins
require("user.cmp")
require("user.lualine")
require("user.formatter")
require("user.telescope")
require("user.whichkey")
require("user.lspkind")
require("user.nvim-tree")
require("user.theme")
require("user.todo-comments")
require("user.matchtag")
require("user.colorizer")
require("user.bufferline")
require("user.spectre")
require("user.autopairs")
require("user.comment")
require("user.presence")

-- keymappings
require("user.mappings")
