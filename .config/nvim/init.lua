-- init.lua
-------------------------------------------------------------------------------
--- Global indentation defaults
-------------------------------------------------------------------------------
vim.o.expandtab		= true 	-- use spaaces, never literal <Tab>s
vim.o.tabstop		= 2	      -- how many columns a typed <Tab> counts for
vim.o.softtabstop	= 2	    -- how many columns <BS>/<Tab> use in Insert mode
vim.o.shiftwidth 	= 2	    -- size of >, <. ==, >>, <<., == operations
vim.o.smartindent	= true	-- keep indent when wrapping lines
vim.o.breakindent = true  -- Indent line breaks

-------------------------------------------------------------------------------
--- Default configuration
-------------------------------------------------------------------------------
-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '

-- [[ Setting options ]] See `:h vim.o`
-- NOTE: You can change these options as you wish!
-- For more options, you can see `:help option-list`
-- To see documentation for an option, you can use `:h 'optionname'`, for example `:h 'number'`
-- (Note the single quotes)

-- Keep undo records
vim.o.undofile = true

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

vim.o.updatetime = 250

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Enable mouse mode, can be useful for resizing splits
vim.o.mouse = "a"

-- Don't show the mode, since it's already in the status line (mini.statusline)
vim.o.showmode = false

-- Print the line number in front of each line
vim.o.number = true

-- Use relative line numbers, so that it is easier to jump with j, k. This will affect the 'number'
-- option above, see `:h number_relativenumber`
vim.o.relativenumber = true

-- Sync clipboard between OS and Neovim. Schedule the setting after `UiEnter` because it can
-- increase startup-time. Remove this option if you want your OS clipboard to remain independent.
-- See `:help 'clipboard'`
vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.o.clipboard = 'unnamedplus'
  end,
})

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Highlight the line where the cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 20

-- Disable commandline until it is needed. This gives us a cleaner look and an extra line
vim.o.cmdheight = 0

-- Show <tab> and trailing spaces
vim.o.list = true
vim.o.listchars = { tab = "» ", trail = ".", nbsp = "␣" }

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s) See `:help 'confirm'`
vim.o.confirm = true

-- [[ Set up keymaps ]] See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h')
vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j')
vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k')
vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l')

-- [[ Basic Autocommands ]].
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})

-- [[ Create user commands ]]
-- See `:h nvim_create_user_command()` and `:h user-commands`

-- Create a command `:GitBlameLine` that print the git blame for the current line
vim.api.nvim_create_user_command('GitBlameLine', function()
  local line_number = vim.fn.line('.') -- Get the current line number. See `:h line()`
  local filename = vim.api.nvim_buf_get_name(0)
  print(vim.fn.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }))
end, { desc = 'Print the git blame for the current line' })

-- [[ Add optional packages ]]
-- Nvim comes bundled with a set of packages that are not enabled by
-- default. You can enable any of them by using the `:packadd` command.

-- For example, to add the "nohlsearch" package to automatically turn off search highlighting after
-- 'updatetime' and when going to insert mode
vim.cmd('packadd! nohlsearch')


-------------------------------------------------------------------------------
--- Host Language Programs
-------------------------------------------------------------------------------
-- Set python and perl host programs
vim.g.python3_host_prog			= '/usr/bin/python3'
vim.g.perl_host_prog			= '/usr/bin/perl'

-- Uncomment any providers you don't need
-- vim.g.loaded_perl_provider		= 0
vim.g.loaded_ruby_provider		= 0
-- vim.g.loaded_python3_provider	= 0


-------------------------------------------------------------------------------
--- Plugin Manager (Lazy.nvim)
-------------------------------------------------------------------------------
-- Bootstrap the plugin
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Create a table with plugins and call lazy.setup
require("lazy").setup({
  -- Core plugins
  { "nvim-lua/plenary.nvim" },

  -- Mason core
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- keep registry up to date
    cmd = "Mason",  -- lazy-load on :Mason commands
    opts = {},      -- use defaults, or override UI/settings here
  },

  -- Mason <-> LSPConfig integration
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = {
        "ansiblels",
        "asm_lsp",
        "awk_ls",
        "bashls",
        "cmake",
        "cssls",
        "css_variables",
        "cssmodules_ls",
        "html",
        "java_language_server",
        "jinja_lsp",
        "jsonls",
        "julials",
        "lua_ls",
        "markdown_oxide",
        "nginx_language_server",
        "pylsp",
        "systemd_ls",
        "ts_ls",
        "vimls",
        "yamlls",
      },
      automatic_installation = true,
    },
  },

  -- LSP configs
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.clangd.setup({})
      lspconfig.ansiblels.setup({})
      lspconfig.asm_lsp.setup({})
      lspconfig.awk_ls.setup({})
      lspconfig.bashls.setup({})
      lspconfig.cmake.setup({})
      lspconfig.cssls.setup({})
      lspconfig.css_variables.setup({})
      lspconfig.cssmodules_ls.setup({})
      lspconfig.html.setup({})
      lspconfig.java_language_server.setup({})
      lspconfig.jinja_lsp.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.julials.setup({})
      lspconfig.lua_ls.setup({})
      lspconfig.markdown_oxide.setup({})
      lspconfig.nginx_language_server.setup({})
      lspconfig.pylsp.setup({})
      lspconfig.systemd_ls.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.vimls.setup({})
      lspconfig.yamlls.setup({})
    end,
  },

  -- Color Scheme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Mini.statusline
  { "echasnovski/mini.statusline", version = false, opts = {} }
})

-------------------------------------------------------------------------------
--- Mason UI Setup
-------------------------------------------------------------------------------
require("mason").setup({})


-------------------------------------------------------------------------------
--- Mini.statusline Setup
-------------------------------------------------------------------------------
require("mini.statusline").setup({})


-------------------------------------------------------------------------------
--- Color Scheme
-------------------------------------------------------------------------------
require("catppuccin").setup({
  flavour = "mocha",                      -- latte | frappe | macchiato | mocha
  transparent_background = true,          -- let the terminal show through
  term_colors = true,                     -- match :terminal palette
  integrations  = {
    cmp         = true,
    gitsigns    = true,
    treesitter  = true,
    -- add or remove integrations as you like
  },
})

vim.cmd.colorscheme("catppuccin")

