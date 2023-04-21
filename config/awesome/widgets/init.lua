local path = ... .. '.'
return setmetatable({}, {
    __index = function(_, value)
        return require(path .. value)
    end,
})
