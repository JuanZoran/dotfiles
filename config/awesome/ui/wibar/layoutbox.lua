return function(s)
    local button = util.button
    local layoutbox = awful.widget.layoutbox(s)
    layoutbox:buttons(util.keys {
        button { 1, function() awful.layout.inc(1) end },
        button { 3, function() awful.layout.inc(-1) end },
        button { 4, function() awful.layout.inc(1) end },
        button { 5, function() awful.layout.inc(-1) end },
    })
    return layoutbox
end
