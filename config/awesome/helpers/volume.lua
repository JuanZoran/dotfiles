local spawn = require 'awful.spawn'

---@class Helper
---@field volume HelperVolume

---@class HelperVolume
local M = {}

M.increase = function(value)
    spawn('pamixer -i ' .. value)
end

M.decrease = function(value)
    spawn('pamixer -d ' .. value)
end

M.mute = function(enable)
    spawn('pamixer -' .. (enable and 'm' or 'u'))
end

M.toggle_mute = function()
    spawn 'pamixer -t'
end

M.get_info_cmd = 'pamixer --get-volume-human'

return M
