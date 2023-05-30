-- local awful = require 'awful'
local M = {}

M.markup_with_color = function(text, bg, fg)
    return '<span '
        .. (bg and 'background="' .. bg .. '"' or '')
        .. (fg and ' foreground="' .. fg .. '"' or '')
        .. text
        .. '</span>'
end

return M
