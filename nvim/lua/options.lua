require "nvchad.options"

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
  },
  filename = {
    [".zshrc"] = "sh",
    [".zshenv"] = "sh",
  },
}
