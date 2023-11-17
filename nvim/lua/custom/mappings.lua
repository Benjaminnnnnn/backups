local M = {}

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
      "<cmd> Telescope jumplists <CR>",
      "List jump list entries",
    },
    ["<leader>vr"] = {
      "<cmd> Telescope registers <CR>",
      "List registers",
    },

    -- git pickers
    ["<leader>gc"] = {
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

M.general = {
  n = {
    ["<F2>"] = {
      "<Cmd> lua vim.lsp.buf.rename() <CR>",
      "Rename symbols",
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
  },
}
-- Add mappings for <leader>h1 through <leader>h9 in a loop
for i = 1, 9 do
  M.harpoon.n[string.format("<leader>h%d", i)] = {
    string.format("<cmd>lua require('harpoon.ui').nav_file(%d)<CR>", i),
    string.format("Harpoon navigate to file %d", i),
  }
end

return M
