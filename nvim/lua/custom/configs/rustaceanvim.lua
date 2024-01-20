vim.g.rustaceanvim = function()
  -- local mason_registry = require "mason-registry"
  -- local codelldb_extension = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
  -- local codelldb_path = codelldb_extension .. "adapter/codelldb"
  -- local liblldb_path = codelldb_extension .. "lldb/lib/liblldb.dylib"

  local extension_path = vim.fn.expand "~" .. "/.vscode/extensions/vadimcn.vscode-lldb-1.10.0"
  local codelldb_path = extension_path .. "/adapter/codelldb"
  local liblldb_path = extension_path .. "/lldb/lib/liblldb"

  local this_os = vim.loop.os_uname().sysname

  -- The path is different on Windows
  if this_os:find "Windows" then
    codelldb_path = extension_path .. "adapter\\codelldb.exe"
    liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
  else
    -- The liblldb extension is .so for Linux and .dylib for MacOS
    liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
  end

  local cfg = require "rustaceanvim.config"

  return {
    -- LSP configuration
    server = {
      on_attach = function() end,
    },
    dap = {
      adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    },
  }
end
