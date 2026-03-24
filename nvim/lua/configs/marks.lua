require("marks").setup {
  default_mappings = true,
  builtin_marks = { ".", "<", ">", "^" },
  cyclic = true,
  force_write_shada = false,
  refresh_interval = 250,
  sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
  excluded_filetypes = {
    "",
    "TelescopePrompt",
    "cmp_menu",
    "cmp_docs",
    "NvimTree",
    "Trouble",
    "aerial",
    "terminal",
  },
  bookmark_0 = {
    sign = "⚑",
    virt_text = "hello world",
    annotate = false,
  },
  mappings = {},
}
