local M = {}

M.general = {
  n = {
    ["<leader>tt"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "Toggle transparency",
    },
    ["<leader>qa"] = {
      function()
        require("nvchad.tabufline").closeAllBufs()
      end,
      "Close all buffers in current tab",
    },
    ["<leader>mbr"] = {
      function()
        require("nvchad.tabufline").move_buf(1)
      end,
      "Move buffer right",
    },
    ["<leader>mbl"] = {
      function()
        require("nvchad.tabufline").move_buf(-1)
      end,
      "Move buffer left",
    },
    ["<F2>"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "Rename symbols",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Run or continue the debugger",
    },
  },
}

M.telescope = {
  n = {
    -- file pickers
    ["<leader>fg"] = {
      "<cmd> Telescope git_files <CR>",
      "Find git files",
    },

    -- vim pickers
    ["<leader>vj"] = {
      "<cmd> Telescope jumplist <CR>",
      "List jump list entries",
    },
    ["<leader>vr"] = {
      "<cmd> Telescope registers <CR>",
      "List registers",
    },
    ["<leader>qf"] = {
      "<cmd> Telescope quickfix <cr>",
      "List quick fix list",
    },
    ["<leader>qh"] = {
      "<cmd> Telescope quickfixhistory <cr>",
      "List quick fix history",
    },

    -- git pickers
    ["<leader>glb"] = {
      "<cmd> Telescope git_branches <CR>",
      "List all git branches",
    },

    -- lsp pickers
    ["<S-F12>"] = {
      "<cmd> Telescope lsp_references <CR>",
      "List LSP references",
    },
    ["<F12>"] = {
      "<cmd> Telescope lsp_definitions <CR>",
      "Go to definition",
    },
    ["<leader>ds"] = {
      "<cmd> Telescope lsp_document_symbols <CR>",
      "List symbols in current buffer",
    },
    ["<leader>ws"] = {
      "<cmd> Telescope lsp_workspace_symbols <CR>",
      "List symbols across workspace",
    },
  },
}

M.gitsigns = {
  n = {
    ["<leader>gd"] = {
      function()
        require("gitsigns").diffthis()
      end,
      "Git diff current buffer",
    },
  },
}

M.lazygit = {
  n = {
    ["<leader>lg"] = {
      "<cmd> LazyGit <CR>",
      "Open LazyGit",
    },
  },
}

M.spectre = {
  n = {
    ["<leader>s"] = {
      "<cmd> lua require('spectre').toggle() <CR>",
      "Toggle Spectre",
    },
  },
}

M.trouble = {
  n = {
    ["<leader>bx"] = {
      function()
        require("trouble").toggle()
      end,
      "Toggle Trouble",
    },
    ["<leader>bw"] = {
      function()
        require("trouble").toggle()
      end,
      "Toggle Trouble workspace diagnostics",
    },
    ["<leader>bb"] = {
      function()
        require("trouble").toggle()
      end,
      "Toggle Trouble buffer diagnostics",
    },
    ["<leader>bq"] = {
      function()
        require("trouble").toggle()
      end,
      "Toggle Trouble quickfix list",
    },
    ["<leader>bl"] = {
      function()
        require("trouble").toggle()
      end,
      "Toggle Trouble location list",
    },
  },
}

M.harpoon = {
  n = {
    ["<leader>ha"] = {
      "<cmd> :lua require('harpoon.mark').add_file() <CR>",
      "Add current buffer to harpoon marks list",
    },
    ["<leader>ht"] = {
      "<cmd> :lua require('harpoon.ui').toggle_quick_menu() <CR>",
      "Toggle harpoon marks list",
    },
    ["<C-t>"] = {
      "<cmd> :lua require('harpoon.ui').nav_next() <CR>",
      "Go to next harpoon file",
    },
    ["<C-p>"] = {
      "<cmd> :lua require('harpoon.ui').nav_prev() <CR>",
      "Go to previous harpoon file",
    },
  },
}
-- Add mappings for <leader>h1 through <leader>h9 in a loop
for i = 1, 9 do
  M.harpoon.n[string.format("<leader>%d", i)] = {
    string.format("<cmd>lua require('harpoon.ui').nav_file(%d)<CR>", i),
    string.format("Harpoon navigate to file %d", i),
  }
end

return M
