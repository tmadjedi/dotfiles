local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","

require("lazy").setup({
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  {
    "neovim/nvim-lspconfig"
  },
  {
    "lewis6991/gitsigns.nvim"
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {}
  }
})

vim.cmd([[colorscheme tokyonight-night]])

lspconfig = require("lspconfig")
lspconfig.pylsp.setup({})

require("lualine").setup({
  options = { 
    icons_enabled = false,
    theme = "tokyonight",
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' }
  }
})

require("gitsigns").setup({
  signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true
})

vim.wo.number = true
-- vim.opt.signcolumn = "number"

vim.opt.guicursor = "n-v-c-sm:block"

-- this is vim, use the keyboard
vim.opt.mouse = ''

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.bo.softtabstop = 4

-- telescope mappings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
