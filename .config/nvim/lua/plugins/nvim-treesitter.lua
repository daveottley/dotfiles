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
    ensure_installed  = M.parsers,
    auto_install      = true,
    sync_install      = false,
    highlight         = { enable = true },
    indent            = { enable = true },
    
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection      = "<Enter>", -- set to `false` to disable one of the mappings
        node_incremental    = "<Enter>",
        scope_incremental  = false,
        node_decremental    = "<Backspace>",
      },
    },
  }

  -- folding / indent helpers
  # vim.wo.foldexpr     = 'v:lua.vim.treesitter.foldexpr()'
  vim.bo.indentexpr   = "v:lua.require'nvim-treesitter'.indentexpr()"
end

return M
