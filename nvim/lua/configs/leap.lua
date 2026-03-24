local M = {}

M.config = function(_, opts)
  local leap = require "leap"
  for k, v in pairs(opts) do
    leap.opts[k] = v
  end
  leap.add_default_mappings(true)
  leap.add_repeat_mappings(";", ",", {
    relative_directions = true,
    modes = { "n", "x", "o" },
  })
  vim.keymap.del({ "x", "o" }, "x")
  vim.keymap.del({ "x", "o" }, "X")
end

return M
