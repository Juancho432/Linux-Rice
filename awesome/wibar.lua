local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local wibar = {}

function wibar.create(s)

    local left_zone = wibox.widget {
            layout = wibox.layout.fixed.horizontal,
            spacing = beautiful.wibar_spacing
    }

    local center_zone = wibox.widget {
            layout = wibox.layout.fixed.horizontal,
            spacing = beautiful.wibar_spacing
    }

    local right_zone = wibox.widget {
            layout = wibox.layout.fixed.horizontal,
            spacing = beautiful.wibar_spacing
    }

    local main_grid = wibox.widget {
        {
            left_zone,
            center_zone,
            right_zone,
            layout = wibox.layout.grid.horizontal,
            homogeneous = false,
            expand = true,
            spacing = 0
        },
        margins = { 
            top = beautiful.wibar_vertical_padding,
            buttom = beautiful.wibar_vertical_padding,
            left = beautiful.wibar_horizontal_padding,
            right = beautiful.wibar_horizontal_padding
        },
        widget = wibox.container.margin,
    }

    s.wibar = awful.wibar { 
        position = "top", 
        screen = s ,
        height = beautiful.wibar_height,
        bg = beautiful.wibar_bg,
        border_color = beautiful.wibar_border,
        border_width = beautiful.wibar_border_width,
        ontop = true,
        margins = beautiful.wibar_margins,
    }

    s.wibar:setup {
        {
            {
                left_zone,
                center_zone,
                right_zone,
                layout = wibox.layout.align.horizontal,
                expand = "none",
            },
            margins = {
                left = beautiful.wibar_horizontal_padding,
                right = beautiful.wibar_horizontal_padding,
                top = beautiful.wibar_horizontal_padding,
                buttom = beautiful.wibar_horizontal_padding,
            },
            widget = wibox.container.margin,
        },
        layout = wibox.layout.align.horizontal,
    }

    s.wibar_left = left_zone
    s.wibar_center = center_zone
    s.wibar_right = right_zone
end

return wibar