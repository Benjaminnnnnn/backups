---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "onedark",
  telescope = { style = "borderless" }, -- borderless / bordered
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "atom", -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

-- line break configuration
vim.opt.textwidth = 79
vim.opt.colorcolumn = { 80, 120 }
vim.opt.breakindent = true
vim.opt.linebreak = true

-- show line numbers and highlight cursor line number
vim.opt.number = true
vim.opt.relativenumber = true

-- set up netrw for 'gx' mapping
vim.g.netrw_browsex_viewer = "open"

-- make zsh files recognized as sh for bash-ls & treesitter
vim.filetype.add {
  extension = {
    zsh = "sh",
    sh = "sh", -- force sh-files with zsh-shebang to still get sh as filetype
  },
  filename = {
    [".zshrc"] = "sh",
    [".zshenv"] = "sh",
  },
}

return M
