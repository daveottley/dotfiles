vim.g.mapleader = ' '

require('core.options').setup()
require('core.keymaps').setup()
require('core.autocmds').setup()
require('core.usercmds').setup()

-- bootstrap Lazy + all plugin specs
require('plugins').setup()
