-- write some utility functions to print colorful text
-- I need: green yellow red blue magenta cyan white
function _G.green(text)
    return '\27[32m' .. text .. '\27[0m'
end

function _G.yellow(text)
    return '\27[33m' .. text .. '\27[0m'
end

function _G.red(text)
    return '\27[31m' .. text .. '\27[0m'
end

function _G.blue(text)
    return '\27[34m' .. text .. '\27[0m'
end

function _G.magenta(text)
    return '\27[35m' .. text .. '\27[0m'
end

function _G.cyan(text)
    return '\27[36m' .. text .. '\27[0m'
end

function _G.white(text)
    return '\27[37m' .. text .. '\27[0m'
end

local function print_table(tbl, indent)
    indent = indent or ''
    for k, v in pairs(tbl) do
        if type(v) == 'table' then
            print(indent .. k .. ' = {')
            print_table(v, indent .. '    ')
            print(indent .. k .. '}')
        else
            print(indent .. k .. ' = ' .. tostring(v))
        end
    end
end

_G.pretty_print_table = print_table
