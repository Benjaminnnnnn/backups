require "nvchad.options"

vim.g.netrw_altv = 1

local opt = vim.opt

opt.textwidth = 79
opt.colorcolumn = { 80, 120 }
opt.breakindent = true
opt.linebreak = true
opt.number = true
opt.relativenumber = true

vim.filetype.add {
  extension = {
    zsh = "sh",
    sh = "sh",
  },
  filename = {
    [".zshrc"] = "sh",
    [".zshenv"] = "sh",
  },
}
