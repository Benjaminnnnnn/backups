require "nvchad.mappings"

local map = vim.keymap.set

local function desc(text)
  return { desc = text }
end

map("n", "<leader>tt", function()
  require("base46").toggle_transparency()
end, desc "Toggle transparency")

map("n", "<leader>qa", function()
  require("nvchad.tabufline").closeAllBufs()
end, desc "Close all buffers in current tab")

map("n", "<leader>mbr", function()
  require("nvchad.tabufline").move_buf(1)
end, desc "Move buffer right")

map("n", "<leader>mbl", function()
  require("nvchad.tabufline").move_buf(-1)
end, desc "Move buffer left")

map("n", "<F2>", require "nvchad.lsp.renamer", desc "Rename symbols")
map("n", "]q", "<cmd>cnext<CR>", desc "Next item in quickfix list")
map("n", "[q", "<cmd>cprev<CR>", desc "Previous item in quickfix list")
map("n", "<leader>lz", "<cmd>Lazy<CR>", desc "Open Lazy UI")

map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc "Add breakpoint at line")
map("n", "<leader>dr", "<cmd>DapContinue<CR>", desc "Run or continue the debugger")
map("n", "<F10>", "<cmd>DapStepOver<CR>", desc "Step over")
map("n", "<F11>", "<cmd>DapStepInto<CR>", desc "Step into")

map("n", "<leader>fg", "<cmd>Telescope git_files<CR>", desc "Find git files")
map("n", "<leader>vj", "<cmd>Telescope jumplist<CR>", desc "List jump list entries")
map("n", "<leader>vr", "<cmd>Telescope registers<CR>", desc "List registers")
map("n", "<leader>qf", "<cmd>Telescope quickfix<CR>", desc "List quickfix list")
map("n", "<leader>qh", "<cmd>Telescope quickfixhistory<CR>", desc "List quickfix history")
map("n", "<leader>glb", "<cmd>Telescope git_branches<CR>", desc "List git branches")
map("n", "<S-F12>", "<cmd>Telescope lsp_references<CR>", desc "List LSP references")
map("n", "<F12>", "<cmd>Telescope lsp_definitions<CR>", desc "Go to definition")
map("n", "<leader>ds", function()
  require("telescope").extensions.aerial.aerial()
end, desc "List symbols in current buffer")
map("n", "<leader>ws", "<cmd>Telescope lsp_workspace_symbols<CR>", desc "List workspace symbols")

map("n", "<leader>gd", function()
  require("gitsigns").diffthis()
end, desc "Git diff current buffer")

map("n", "<leader>lg", "<cmd>LazyGit<CR>", desc "Open LazyGit")
map("n", "<leader>sr", function()
  require("spectre").toggle()
end, desc "Toggle Spectre")

map("n", "<leader>bt", "<cmd>Trouble diagnostics toggle<CR>", desc "Toggle Trouble diagnostics")
map("n", "<leader>bw", "<cmd>Trouble diagnostics toggle<CR>", desc "Open Trouble workspace diagnostics")
map("n", "<leader>bb", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc "Open Trouble buffer diagnostics")
map("n", "<leader>bq", "<cmd>Trouble qflist toggle<CR>", desc "Open Trouble quickfix list")
map("n", "<leader>bl", "<cmd>Trouble loclist toggle<CR>", desc "Open Trouble location list")

map("n", "<leader>a", "<cmd>AerialToggle!<CR>", desc "Toggle Aerial symbols")
map("n", "<leader>o", "<cmd>OrganizeImports<CR>", desc "Organize imports")
map("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", desc "Markdown preview")
map("n", "<leader>mt", "<cmd>NoiceTelescope<CR>", desc "Noice messages in Telescope")

map("n", "<leader>ha", function()
  require("harpoon.mark").add_file()
end, desc "Add current buffer to harpoon")

map("n", "<leader>ht", function()
  require("harpoon.ui").toggle_quick_menu()
end, desc "Toggle harpoon list")

map("n", "<C-t>", function()
  require("harpoon.ui").nav_next()
end, desc "Go to next harpoon file")

map("n", "<C-p>", function()
  require("harpoon.ui").nav_prev()
end, desc "Go to previous harpoon file")
