
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")

-- Local Modules
local keys = require("keys")
local wibar = require("wibar")
local signals = require("signals")
local notifications = require("notification")
 
-- Error handling
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end

-- Variable definitions
local config_path = gears.filesystem.get_configuration_dir()
beautiful.init(config_path .. "theme/theme.lua")
terminal = "kitty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. editor
modkey = "Mod4"

-- Layout
awful.layout.layouts = {
    awful.layout.suit.spiral.dwindle,
}

local function set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

-- Desktop
awful.screen.connect_for_each_screen(
    function(s)
        set_wallpaper(s)
        awful.tag({ "1", "2", "3", "4" }, s, awful.layout.layouts[1])
        wibar.create(s)
    end
)

-- Keys
root.keys(keys.globalkeys or {})

-- Signals
signals.init()

-- notifications
notifications.init()