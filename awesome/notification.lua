local naughty = require("naughty")
local beautiful = require("beautiful")
local gears = require("gears")

local notification = {}

function notification.init()
    naughty.config.defaults.timeout = 5
    naughty.config.defaults.position = "top_right"
    naughty.config.defaults.margin = 12
    naughty.config.defaults.border_width = 2
    naughty.config.defaults.border_color = beautiful.border_focus
    naughty.config.defaults.shape = function(cr, w, h)
        gears.shape.rounded_rect(cr, w, h, s)
    end
end

return notification