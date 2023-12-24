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
  "bashls",
}

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

local merge_tb = function(left, right)
  return vim.tbl_deep_extend("force", left, right)
end

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
    opts = merge_tb(opts, {
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
    opts = merge_tb(opts, {
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
    opts = merge_tb(opts, {
      settings = {
        tailwindCSS = {
          experimental = {
            classRegex = {
              {
                "Styles \\=([^;]*);",
                "Classes \\=([^;]*);",
                "Variants \\=([^;]*);",
              },
            },
          },
        },
      },
    })
  end

  lspconfig[lsp].setup {
    opts,
  }
  -- lspconfig[lsp].setup {
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --   autotag = {
  --     enable = true,
  --   },
  -- }
end

-- go formatting
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.go",
--   callback = function()
--     local params = vim.lsp.util.make_range_params()
--     params.context = { only = { "source.organizeImports" } }
--     -- buf_request_sync defaults to a 1000ms timeout. Depending on your
--     -- machine and codebase, you may want longer. Add an additional
--     -- argument after params if you find that you have to write the file
--     -- twice for changes to be saved.
--     -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
--     local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
--     for cid, res in pairs(result or {}) do
--       for _, r in pairs(res.result or {}) do
--         if r.edit then
--           local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
--           vim.lsp.util.apply_workspace_edit(r.edit, enc)
--         end
--       end
--     end
--     vim.lsp.buf.format { async = false }
--   end,
-- })
