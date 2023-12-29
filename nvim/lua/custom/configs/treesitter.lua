local opts = {
  ensure_installed = {
    -- defaults
    "vim",
    "lua",
    "go",
    "rust",
    "python",
    "vimdoc",
    "toml",

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
        ["a/"] = { query = "@comment.outer", desc = "Select a comment inline/block" },

        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>sn"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>sp"] = "@parameter.inner",
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
