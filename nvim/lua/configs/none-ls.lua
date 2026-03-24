local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local function optional_source(module)
  local ok, source = pcall(require, module)
  if ok then
    return source
  end
end

local sources = {
  formatting.prettier,
  formatting.stylua,
  formatting.gofumpt,
  formatting.goimports_reviser,
  formatting.golines,
  formatting.black,
  formatting.shfmt,
}

local rustfmt = optional_source "null-ls.builtins.formatting.rustfmt"
  or optional_source "none-ls.formatting.rustfmt"
if rustfmt then
  table.insert(sources, rustfmt)
end

local shellcheck = optional_source "null-ls.builtins.diagnostics.shellcheck"
if shellcheck then
  table.insert(sources, shellcheck)
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { async = false }
        end,
      })
    end
  end,
}
