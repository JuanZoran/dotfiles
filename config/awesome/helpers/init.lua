-- local awful = require 'awful'
local path = ... .. '.'

---@class Helper
local M = setmetatable({}, {
    __index = function(self, key)
        local v = require(path .. key)
        rawset(self, key, v)
        return v
    end,
})

M.markup_with_color = function(text, fg, bg)
    return '<span '
        .. (fg and ' foreground="' .. fg .. '"' or '')
        .. (bg and 'background="' .. bg .. '"' or '')
        .. text
        .. '</span>'
end

return M
