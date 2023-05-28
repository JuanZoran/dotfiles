local container = wibox.container
return container.background(
    container.margin(require 'lib.mapper.widget.text', 10, 10),
    beautiful.color.purple,
    gears.shape.rounded_rect
)
