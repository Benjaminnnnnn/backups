local base = require "plugins.configs.lspconfig"
local on_attach = base.on_attach
local capabilities = base.capabilities

-- Document colorizer (for tailwindcss)
capabilities.textDocument.colorProvider = {
  dynamicRegistration = true,
}

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
  "bashls",
  "eslint",
}

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

local merge_tb = vim.tbl_deep_extend

-- configure all lsps
for _, lsp in ipairs(servers) do
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
    autotag = {
      enable = true,
    },
  }

  -- add extra config for individual lsp
  if lsp == "tsserver" then
    opts = merge_tb("force", opts, {
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
  elseif lsp == "gopls" then
    opts = merge_tb("force", opts, {
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
          gofumpt = true,
        },
      },
    })
  elseif lsp == "tailwindcss" then
    opts = merge_tb("force", opts, {
      settings = {
        tailwindCSS = {
          experimental = {
            classRegex = {
              { "Styles \\=([^;]*);", '"([^"]*)"' },
              { "Classes \\=([^;]*);", '"([^"]*)"' },
              { "Variants \\=([^;]*);", '"([^"]*)"' },
            },
          },
        },
      },
    })
  end

  lspconfig[lsp].setup(opts)
end
