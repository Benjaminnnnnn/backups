local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

-- Assuming MacOS
HOME_PATH = os.getenv "HOME" .. "/"
MASON_PATH = HOME_PATH .. ".local/share/nvim/mason/packages/"
local codelldb_path = MASON_PATH .. "codelldb/extension/adapter/codelldb"
local liblldb_path = MASON_PATH .. "codelldb/extension/lldb/lib/liblldb.dylib"

local options = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
  dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
  },
}

return options
