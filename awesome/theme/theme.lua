
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gears = require("gears")
local theme_path = gears.filesystem.get_configuration_dir().."theme/"

local theme = {}

theme.font          = "sans 8"

theme.bg_normal     = "#343A40"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap   = dpi(0)
theme.border_width  = dpi(1)
theme.border_normal = "#ADB5BD"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

theme.menu_submenu_icon = theme_path.."submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

theme.wallpaper = theme_path.."background.png"

-- WIBAR
theme.wibar_height = 40
theme.wibar_vertical_padding = 4
theme.wibar_horizontal_padding = 22
theme.wibar_margins = {
    top = 15,
    buttom = 15,
    left = 22,
    right = 22
}

theme.wibar_bg = theme.bg_normal
theme.wibar_border = theme.border_normal
theme.wibar_border_width = 1
theme.wibar_spacing = 22

theme.logo = theme_path.."Kerb3ruX_Logo.svg"

return theme
