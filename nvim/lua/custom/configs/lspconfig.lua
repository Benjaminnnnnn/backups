local configs = require "plugins.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  "clangd",
  "gopls",
  "tsserver",
  "rust_analyzer",
  "tailwindcss",
  "pyright",
}

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

for _, lsp in ipairs(servers) do
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if lsp == "tsserver" then
    opts = vim.tbl_deep_extend("force", opts, {
      init_options = {
        preferences = {
          disableSuggestions = true,
        },
      },
      commands = {
        OrganizeImports = {
          organize_imports,
          description = "Organize Imports",
        },
      },
    })
  end

  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    autotag = {
      enable = true,
    },
  }
end
