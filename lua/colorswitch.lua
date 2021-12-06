local M = {}

function M.background(value)
  vim.o.background = value

  local Path = require 'plenary.path'

  path = vim.fn.stdpath 'data' .. '/color-switch-state'
  local p = Path:new(path)
  if not p:exists() then
    p:touch { parents = true }
  end

  p:write(value, 'w')
end

return M
