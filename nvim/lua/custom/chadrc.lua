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

local opt = vim.opt
opt.ruler = true
opt.colorcolumn = "100"
opt.relativenumber = true

vim.g.netrw_browsex_viewer = "xdg-open"

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
