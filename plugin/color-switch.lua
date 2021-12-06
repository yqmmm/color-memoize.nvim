local is_initialized = false

if is_initialized then
  return
end
is_initialized = true

local Path = require 'plenary.path'

path = vim.fn.stdpath 'data' .. '/color-switch-state'
local p = Path:new(path)
if not p:exists() then
  p:touch { parents = true }
end

content = p:readlines()

vim.o.background = content[1]

vim.cmd([[
  command! -nargs=1 Background lua require'colorswitch'.background(<args>)
]])
