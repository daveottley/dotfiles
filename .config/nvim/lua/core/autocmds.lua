local M = {}

function M.setup()
  -- clipboar sync
  vim.api.nvim_create_autocmd('UIEnter', {
    callback = function() vim.opt.clipboard = 'unnamedplus' end,
  })

  -- highlight yank
  vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking',
    callback = function() vim.hl.on_yank() end,
  })

  -- load nohlsearch helper
  vim.cmd('packadd! nohlsearch')
end

return M
