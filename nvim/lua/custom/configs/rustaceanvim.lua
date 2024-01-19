vim.g.rustaceanvim = function()
  local this_os = vim.loop.os_uname().sysname
  local extension_path = vim.env.HOME .. "/mason/packages/codelldb/extension"
  local codelldb_path = extension_path .. "/adapter/codelldb"
  local liblldb_path = extension_path .. "/lldb/lib/liblldb" .. (this_os == "Linux" and ".so" or ".dylib")

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
    dap = {
      adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    },
  }
end
