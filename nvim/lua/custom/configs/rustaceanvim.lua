vim.g.rustaceanvim = function()
  local mason_registry = require "mason-registry"
  local codelldb_extension = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
  local codelldb_path = codelldb_extension .. "adapter/codelldb"
  local liblldb_path = codelldb_extension .. "lldb/lib/liblldb.dylib"

  local cfg = require "rustaceanvim.config"

  return {
    dap = {
      adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    },
  }
end
