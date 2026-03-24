---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",
}

M.ui = {
  telescope = { style = "borderless" },
  cmp = {
    style = "atom",
  },
}

M.mason = {
  pkgs = {
    "gopls",
    "lua-language-server",
    "pyright",
    "rust-analyzer",
    "tailwindcss-language-server",
    "typescript-language-server",
    "bash-language-server",
    "shellcheck",
    "eslint-lsp",
    "css-lsp",
    "prettier",
    "prettierd",
    "gofumpt",
    "goimports-reviser",
    "golines",
    "shfmt",
    "js-debug-adapter",
    "go-debug-adapter",
    "codelldb",
  },
}

return M
