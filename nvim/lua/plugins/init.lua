return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, require "configs.treesitter")
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "tsx",
      "jsx",
      "rescript",
      "xml",
      "php",
      "markdown",
      "astro",
      "glimmer",
      "handlebars",
      "hbs",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "nvimtools/none-ls.nvim",
        config = function()
          require "configs.none-ls"
        end,
      },
    },
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  {
    "saecki/crates.nvim",
    tag = "stable",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup {
        completion = {
          cmp = {
            enabled = true,
          },
        },
      }
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      file_types = { "*", "!cmp_menu", "!cmp_docs" },
      user_default_options = {
        css = true,
        tailwind = "both",
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        linehl = false,
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 500,
          ignore_whitespace = true,
        },
      })
    end,
  },

  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.marks"
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.noice"
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = function()
      require("tailwindcss-colorizer-cmp").setup()
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = {
      history = true,
      updateevents = "TextChanged,TextChangedI",
    },
    config = function(_, opts)
      require("luasnip").config.set_config(opts)
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.vscode_snippets_path or "" }
      require("luasnip.loaders.from_snipmate").load()
      require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.g.snipmate_snippets_path or "" }
      require("luasnip.loaders.from_lua").load()
      require("luasnip.loaders.from_lua").lazy_load { paths = vim.g.lua_snippets_path or "" }
      require "configs.friendly-snippets"

      vim.api.nvim_create_autocmd("InsertLeave", {
        callback = function()
          if
            require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
            and not require("luasnip").session.jump_active
          then
            require("luasnip").unlink_current()
          end
        end,
      })
    end,
  },

  {
    "windwp/nvim-autopairs",
    opts = {
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "vim" },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local format = opts.formatting and opts.formatting.format

      if format then
        opts.formatting.format = function(entry, item)
          item = format(entry, item)
          return require("tailwindcss-colorizer-cmp").formatter(entry, item)
        end
      end

      local has_crates = false
      for _, source in ipairs(opts.sources or {}) do
        if source.name == "crates" then
          has_crates = true
          break
        end
      end

      if not has_crates then
        table.insert(opts.sources, { name = "crates" })
      end

      return opts
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },

  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    opts = function(_, opts)
      opts.pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
      return opts
    end,
  },

  {
    "mfussenegger/nvim-dap",
    cmd = {
      "DapContinue",
      "DapToggleBreakpoint",
      "DapStepInto",
      "DapStepOver",
    },
    config = function()
      require "configs.dap"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, require "configs.nvimtree")
    end,
  },

  {
    "ggandor/leap.nvim",
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      require("configs.leap").config(_, opts)
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = function()
      return require "configs.todo-comments"
    end,
  },

  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },

  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
  },

  {
    "stevearc/aerial.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope.nvim",
    },
    opts = function()
      return require "configs.aerial"
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "configs.lint"
    end,
  },

  {
    "ThePrimeagen/harpoon",
  },

  {
    "wakatime/vim-wakatime",
    lazy = false,
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      pcall(require("telescope").load_extension, "lazygit")
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, require "configs.telescope")
    end,
  },
}
