local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

-- File explorer
Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-telescope/telescope.nvim')
Plug('nvim-lua/plenary.nvim')
Plug('neovim/nvim-lspconfig')
-- Plug('folke/tokyonight.nvim')
Plug('scottmckendry/cyberdream.nvim')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('windwp/nvim-ts-autotag')

vim.call('plug#end')

vim.cmd[[colorscheme cyberdream]]

-- Nvim-tree setup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true
vim.diagnostic.config({ virtual_text = false })

vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>r", ":Telescope treesitter<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>t", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>c", ":NvimTreeCollapse<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>b", ":Telescope buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>h", ":noh<CR>", { noremap = true, silent = true })

require('nvim-tree').setup()

require("guy.core.options")

local actions = require("telescope.actions")

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-d>"] = actions.delete_buffer,
      },
      n = {
        ["<C-d>"] = actions.delete_buffer,
      },
    },
  },
}

require("nvim-treesitter.configs").setup({
  ensure_installed = { 'html', 'javascript', 'ruby' },
  highlight = { enable = true },
  autotag = { enable = true },
  autopairs = { enable = true }
})

local lspconfig = require("lspconfig")

lspconfig.ruby_lsp.setup({
  cmd = { "ruby-lsp" },
  on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  end,
})
