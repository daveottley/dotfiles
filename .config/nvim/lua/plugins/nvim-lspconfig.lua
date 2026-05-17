local M = {}

function M.setup()
  local servers = {
    ansiblels = {
      filetypes = { "yaml" },
    },
    asm_lsp = {},
    awk_ls = {},
    bashls = {},
    clangd = {},
    csharp_ls = {},
    css_variables = {},
    cssls = {},
    cssmodules_ls = {},
    html = {},
    jinja_lsp = {},
    jsonls = {},
    julials = {},
    markdown_oxide = {},
    pylsp = {},
    gopls = {
      filetypes = { "go", "gomod", "gowork" },
    },
    sqls = {},
    systemd_ls = {},
    ts_ls = {
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    },
    vimls = {},
    yamlls = {
      filetypes = { "yaml" },
    },

    lua_ls = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
        },
      },
    },
  }

  for name, config in pairs(servers) do
    vim.lsp.config(name, config)
    vim.lsp.enable(name)
  end
end

return M
