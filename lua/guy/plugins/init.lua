local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-tree/nvim-web-devicons" },
  { "nvim-telescope/telescope.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "neovim/nvim-lspconfig" },
  { "scottmckendry/cyberdream.nvim" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "windwp/nvim-ts-autotag" },
  { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
  { "rafamadriz/friendly-snippets" },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
  },
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
  },
})
