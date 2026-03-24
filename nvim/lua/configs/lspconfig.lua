local nvlsp = require "nvchad.configs.lspconfig"

nvlsp.defaults()

local function organize_imports()
  vim.lsp.buf.execute_command {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
end

local servers = {
  "html",
  "cssls",
  "clangd",
  "gopls",
  "ts_ls",
  "rust_analyzer",
  "tailwindcss",
  "pyright",
  "bashls",
  "eslint",
}

for _, server in ipairs(servers) do
  local opts = {
    capabilities = nvlsp.capabilities,
    on_init = nvlsp.on_init,
  }

  if server == "ts_ls" then
    opts.init_options = {
      preferences = {
        disableSuggestions = true,
      },
    }

    opts.commands = {
      OrganizeImports = {
        organize_imports,
        description = "Organize Imports",
      },
    }
  elseif server == "gopls" then
    opts.settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        gofumpt = true,
      },
    }
  elseif server == "tailwindcss" then
    opts.settings = {
      tailwindCSS = {
        experimental = {
          classRegex = {
            { "Styles \\=([^;]*);", '"([^"]*)"' },
            { "Classes \\=([^;]*);", '"([^"]*)"' },
            { "Variants \\=([^;]*);", '"([^"]*)"' },
          },
        },
      },
    }
  elseif server == "rust_analyzer" then
    opts.settings = {
      ["rust-analyzer"] = {
        cargo = {
          features = "all",
        },
      },
    }
  end

  vim.lsp.config(server, opts)
end

vim.lsp.enable(servers)
