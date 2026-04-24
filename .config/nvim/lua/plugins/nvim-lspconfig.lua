local M = {}

function M.setup()
  local servers = {
    ansiblels = {},
    asm_lsp = {},
    awk_ls = {},
    bashls = {},
    clangd = {},
    cmake = {},
    css_variables = {},
    cssls = {},
    cssmodules_ls = {},
    html = {},
    java_language_server = {},
    jinja_lsp = {},
    jsonls = {},
    julials = {},
    markdown_oxide = {},
    nginx_language_server = {},
    pylsp = {},
    systemd_ls = {},
    ts_ls = {},
    vimls = {},
    yamlls = {},

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
