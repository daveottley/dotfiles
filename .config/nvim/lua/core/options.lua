local M = {}

function M.setup()
  local opt = vim.opt

  -- indentation
  opt.expandtab      = true
  opt.tabstop        = 2
  opt.softtabstop    = 2
  opt.shiftwidth     = 2
  opt.smartindent    = true
  opt.breakindent    = true

  -- general behavior
  opt.undofile       = true
  opt.signcolumn     = 'yes'
  opt.updatetime     = 250
  opt.splitright     = true
  opt.splitbelow     = true
  opt.mouse          = 'a'
  opt.showmode       = false
  opt.number         = true
  opt.relativenumber = true
  opt.ignorecase     = true
  opt.smartcase      = true
  opt.cursorline     = true
  opt.scrolloff      = 25
  opt.cmdheight      = 0
  opt.list           = true
  opt.listchars      = { tab = '» ', trail = '.', nbsp = '␣' }
  opt.confirm        = true

  -- host providers
  vim.g.python3_host_prog    = '/usr/bin/python3'
  vim.g.perl_host_prog       = '/usr/bin/perl'
  vim.g.loaded_ruby_provider = 0
end

return M
