local dap = require "dap"

dap.adapters["pwa-node"] = {
  type = "server",
  host = "127.0.0.1",
  port = 8123,
  executable = {
    command = "js-debug-adapter",
  },
}

for _, language in ipairs { "typescript", "javascript" } do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      runtimeExecutable = "node",
    },
  }
end

-- -- Rust/C/C++
-- dap.adapters.codelldb = {
--   type = "server",
--   port = "${port}",
--   executable = {
--     command = "$HOME/.local/share/nvim/mason/packages/codelldb",
--     args = { "--port", "${port}" },
--   },
-- }
--
-- dap.configurations.rust = {
--   {
--     name = "Rust debug",
--     type = "codelldb",
--     request = "launch",
--     program = function()
--       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
--     end,
--     cwd = "${workspaceFolder}",
--     stopOnEntry = true,
--     showDisassembly = "never",
--   },
-- }
