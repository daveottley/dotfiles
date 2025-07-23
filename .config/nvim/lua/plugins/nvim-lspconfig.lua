local M = {}

function M.setup()
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
  lspconfig.lua_ls.setup({
    settings = {
      Lua = {
        diagnostics = {
          globals = {"vim"},    -- stop "undefined global" warnings
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false, --remove annoying prompt
        },
      },
    },
  })
  lspconfig.markdown_oxide.setup({})
  lspconfig.nginx_language_server.setup({})
  lspconfig.pylsp.setup({})
  lspconfig.systemd_ls.setup({})
  lspconfig.ts_ls.setup({})
  lspconfig.vimls.setup({})
  lspconfig.yamlls.setup({})
end
