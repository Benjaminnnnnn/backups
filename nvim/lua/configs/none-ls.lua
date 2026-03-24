local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local sources = {
  formatting.prettier,
  formatting.stylua,
  formatting.gofumpt,
  formatting.goimports_reviser,
  formatting.golines,
  formatting.rustfmt,
  formatting.black,
  formatting.shfmt,
}

local ok, shellcheck = pcall(require, "null-ls.builtins.diagnostics.shellcheck")
if ok then
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
