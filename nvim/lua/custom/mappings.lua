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
    ["<leader>gb"] = {
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
  },
}

return M
