local M = {}

function M.setup()
  -- leave terminal mode
  vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

  -- window navigation
  local ti = { 't', 'i' }
  vim.keymap.set(ti, '<A-h>', '<C-\\><C-n><C-w>h')
  vim.keymap.set(ti, '<A-j>', '<C-\\><C-n><C-w>j')
  vim.keymap.set(ti, '<A-k>', '<C-\\><C-n><C-w>k')
  vim.keymap.set(ti, '<A-l>', '<C-\\><C-n><C-w>l')

  local n = { 'n' }
  vim.keymap.set(n, '<A-h>', '<C-w>h')
  vim.keymap.set(n, '<A-j>', '<C-w>j')
  vim.keymap.set(n, '<A-k>', '<C-w>k')
  vim.keymap.set(n, '<A-l>', '<C-w>l')
end

return M
