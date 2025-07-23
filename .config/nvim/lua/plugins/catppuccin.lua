local M = {}

function M.setup()
  require('catppuccin').setup {
    flavour = 'mocha',
    transparent_background = true,
    term_colors = true,
    integrations = {
      cmp         = true,
      gitsigns    = true,
      treesitter  = true,
    },
  }

  vim.cmd.colorscheme('catppuccin')

  local opaque = '#1e1e1e'
  vim.api.nvim_set_hl(0, 'SignColumn',    { bg = opaque })
  vim.api.nvim_set_hl(0, 'LineNr',        { bg = opaque })
  vim.api.nvim_set_hl(0, 'CursorLineNr',  { bg = opaque, bold = true })

  vim.opt.colorcolumn = { '80' }
  vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#303030' })
end

return M
