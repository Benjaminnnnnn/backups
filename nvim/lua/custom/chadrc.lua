---@type ChadrcConfig
local M = {}

M.ui = { theme = "onedark" }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

local opt = vim.opt
opt.ruler = true
opt.colorcolumn = "100"
opt.relativenumber = true

return M
