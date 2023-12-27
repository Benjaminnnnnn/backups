---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "onedark",
  telescope = { style = "bordered" }, -- borderless / bordered
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

local opt = vim.opt
opt.ruler = true
opt.colorcolumn = "100"
opt.relativenumber = true

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
