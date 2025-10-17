local awful = require("awful")
local gears = require("gears")

local keys = {}

keys.globalkeys = gears.table.join(
    awful.key (
        { "Mod4" }, "r",
        awesome.restart,
        {
            description = "Restart Awesome",
            group = "Awesome"
        }
    ),
    awful.key (
        { "Mod4" }, "c",
        function()
            awful.spawn("code")
        end,
        {
            description = "Launch VSCode",
            group = "Launcher"
        }
    )
)

keys.clientkeys = gears.table.join()

return keys
