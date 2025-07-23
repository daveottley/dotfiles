local M = {}

function M.setup()
  require('mason').setup()
  require('mason-lspconfig').setup {
    ensure_installed = {
      'ansiblels','asm_lsp','awk_ls','bashls','clangd','cmake',
      'csharp_ls','cssls','css_variables','cssmodules_ls','fish_lsp',
      'gopls','html','java_language_server','jinja_lsp','jsonls',
      'julials','lua_ls','markdown_oxide','nginx_language_server',
      'pylsp','sqls','systemd_ls','ts_ls','vimls','yamlls',
    },
    automatic_installation = true,
  }
end

return M
