local M = {}

function M.setup()
  -- bootstrap lazy.nvim
  local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      'git', 'clone', '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git', lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  local plugins = {
    -- Treesitter core
    {
      'nvim-treesitter/nvim-treesitter',
      build  = ':TSUpdate',
      lazy   = false,
      config = function() 
        require('plugins.nvim-treesitter').setup() 
      end,
    },
    -- Treesitter - textobjects
    {
      'nvim-treesitter/nvim-treesitter-textobjects',
      lazy = false,
      dependencies = { 'nvim-treesitter/nvim-treesitter' },
      config = function()
        require('plugins.nvim-treesitter-textobjects').setup()
      end,
    },

    -- Mason + LSP
    {
      'williamboman/mason.nvim',
      build = ':MasonUpdate',
      cmd   = 'Mason',
    },
    {
      'williamboman/mason-lspconfig.nvim',
      dependencies = { 'williamboman/mason.nvim' },
      config = function() require('plugins.mason').setup() end,
    },
    {
      'neovim/nvim-lspconfig',
      dependencies = { 'williamboman/mason-lspconfig.nvim' },
      config = function() require('plugins.nvim-lspconfig').setup() end,
    },

    -- Theme
    {
      'catppuccin/nvim',
      name      = 'catppuccin',
      priority  = 1000,
      config    = function() require('plugins.catppuccin').setup() end,
    },

    -- Mini statusline
    {
      'echasnovski/mini.statusline',
      version = false,
      config  = function() require('plugins.mini').setup() end,
    },
  }

  require('lazy').setup(plugins)
end

return M
