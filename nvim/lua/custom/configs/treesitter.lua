local opts = {
  ensure_installed = {
    -- defaults
    "vim",
    "lua",
    "go",
    "rust",
    "python",

    -- web dev
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "json",
  },
  auto_install = true,

  incremental_selection = {
    enable = false,
    keymaps = {
      init_selection = "<c-space>",
      node_incremental = "<c-space>",
      node_decremental = "<M-space>",
    },
  },

  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

return opts
