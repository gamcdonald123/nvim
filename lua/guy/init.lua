vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("guy.plugins.init")
require("guy.core.options")
require("guy.core.keymaps")
require("guy.plugins.config") -- treesitter, telescope, lsp etc.
require("guy.plugins.luasnip")
