local M = {}

function M.setup()
  vim.api.nvim_create_user_command('GitBlameLine', function()
    local line = vim.fn.line('.')
    local file = vim.api.nvim_buf_get_name(0)
    print(vim.fn.system({ 'git', 'blame', '-L', line .. ',+1', file }))
  end, { desc = 'Print git blame for the current line' })
end

return M
