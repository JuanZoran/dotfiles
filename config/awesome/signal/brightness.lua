local M = {}

local spawn = require 'awful.spawn'
M.current = io.popen('xbacklight -get'):read '*n'

local emit_signal = awesome.emit_signal
M.increase = function(value)
    spawn('xbacklight -inc ' .. value)
    M.current = M.current + value
    if M.current > 100 then M.current = 100 end
    emit_signal('brightness::change', M.current)
end

M.decrease = function(value)
    spawn('xbacklight -dec ' .. value)
    M.current = M.current - value
    if M.current < 0 then M.current = 0 end
    emit_signal('brightness::change', M.current)
end


return M
