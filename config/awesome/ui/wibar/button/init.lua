local path = ... .. '.'
return setmetatable({}, {
    __index = function(_, name)
        return require(path .. name)
    end,
})
