local M = {}

M.parsers = {
  'asm','awk','bash','c','c_sharp','cmake','cpp','css','csv','cuda',
  'diff','fish','git_config','git_rebase','gitcommit','gitignore','go',
  'html','java','javascript','jinja','json','julia','lua','luadoc',
  'markdown','nginx','python','regex','sql','toml','typescript','udev',
  'vim','vimdoc','yaml','zig',
}

function M.setup()
  require('nvim-treesitter').setup {
    install_dir = vim.fn.stdpath('data') .. '/site',
  }

  require('nvim-treesitter').install(M.parsers)

  vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function(ev)
      if pcall(vim.treesitter.start, ev.buf) then
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end,
  })

end

return M
