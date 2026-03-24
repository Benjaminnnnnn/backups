local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting

null_ls.setup {
  sources = {
    formatting.prettierd.with {
      prefer_local = "node_modules/.bin",
    },
    formatting.stylua,
    formatting.gofumpt,
    formatting.goimports_reviser,
    formatting.golines,
    formatting.black,
    formatting.shfmt,
  },
}
