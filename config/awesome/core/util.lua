local util = {}
---Setup Keys
---@param keys any[]
---@return table
function util.keys(keys)
    local ret = {}
    for i = 1, #keys do
        local t = keys[i]
        if t then
            for key, v in pairs(t) do
                if type(key) == 'number' then
                    ret[#ret + 1] = v
                else
                    ret[key] = v
                end
            end
        end
    end
    return ret
end

util.enum = {
    bottom = {
        LEFT        = 1,
        MIDDLE      = 2,
        RIGHT       = 3,
        SCROLL_UP   = 4,
        SCROLL_DOWN = 4,
    },
}


---@alias botton_key table
local button = awful.button

---Reduce useless mode key placehoder
---@param opts {}
---@return botton_key
function util.button(opts)
    local mods = opts.mods or {}
    return button(mods, opts[1], opts[2])
end

util.home = os.getenv 'HOME'
util.conf_dir = util.home .. '/.config/awesome'


_G.util = util
