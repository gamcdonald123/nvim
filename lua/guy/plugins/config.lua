-- Set colorscheme
vim.cmd([[colorscheme cyberdream]])

-- Disable netrw (conflicts with nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- General UI settings
vim.opt.termguicolors = true
vim.diagnostic.config({ virtual_text = false })

-- Treesitter config
require("nvim-treesitter.configs").setup({
  ensure_installed = { "html", "javascript", "ruby" },
  highlight = { enable = true },
  autotag = { enable = true },
  autopairs = { enable = true },
})

-- Aerial config
require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")

-- Nvim-tree setup
require("nvim-tree").setup({
  filters = {
    git_ignored = false,
  }
})

-- Telescope setup
local actions = require("telescope.actions")
require("telescope").setup({
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
})

-- LSP configuration
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

