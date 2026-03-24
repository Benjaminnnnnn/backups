local nvlsp = require "nvchad.configs.lspconfig"

nvlsp.defaults()

local format_augroup = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true })
local formatters_by_ft = {
  bash = "null-ls",
  css = "null-ls",
  go = "null-ls",
  html = "null-ls",
  javascript = "null-ls",
  javascriptreact = "null-ls",
  json = "null-ls",
  jsonc = "null-ls",
  lua = "null-ls",
  markdown = "null-ls",
  python = "null-ls",
  rust = "rust_analyzer",
  sh = "null-ls",
  typescript = "null-ls",
  typescriptreact = "null-ls",
  yaml = "null-ls",
  zsh = "null-ls",
}

local function supports_formatting(client)
  if vim.fn.has "nvim-0.11" == 1 then
    return client:supports_method "textDocument/formatting"
  end

  return client.supports_method and client.supports_method "textDocument/formatting"
end

local function setup_format_on_save(client, bufnr)
  if not supports_formatting(client) then
    return
  end

  local formatter = formatters_by_ft[vim.bo[bufnr].filetype]
  if formatter and client.name ~= formatter then
    return
  end

  vim.api.nvim_clear_autocmds { group = format_augroup, buffer = bufnr }
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = format_augroup,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format {
        async = false,
        bufnr = bufnr,
        filter = formatter and function(format_client)
          return format_client.name == formatter
        end or nil,
      }
    end,
  })
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      setup_format_on_save(client, args.buf)
    end
  end,
})

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
        rustfmt = {
          extraArgs = {},
        },
      },
    }
  end

  vim.lsp.config(server, opts)
end

vim.lsp.enable(servers)
