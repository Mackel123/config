---------------------------

-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir()

local theme = {}

theme.font          = "JetBrainsMonoNL Nerd Font 10"

theme.bg_normal     = "#2e3440"..'0.6'
theme.bg_focus      = "#4c566a"
theme.bg_urgent     = "#2e3440"
theme.bg_minimize   = "#434c5e"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#d8dee9"
theme.fg_focus      = "#d8dee9"
theme.fg_urgent     = "#d8dee9"
theme.fg_minimize   = "#d8dee9"

theme.useless_gap   = dpi(10)
theme.gap_single_client = dpi(0)
theme.border_width  = dpi(3)
theme.border_normal = "#434c5e"
theme.border_focus  = "#5e81ac"
theme.border_marked = "#ebcb8b"

-- There are other variable sets
-- overriding the nord one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
theme.taglist_bg_focus = "#ebcb8b"
theme.taglist_fg_focus = "#2e3440"
theme.tasklist_disable_icon = true
theme.taglist_font = "Iosevka Nerd Font 10"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
theme.notification_font = "JetBrainsMonoNL  Nerd Font 10"
theme.notification_bg = "#3b4252"
theme.notifacition_fg = "#d8dee9"
theme.notification_width = 300
theme.notification_height = 80
theme.notification_margin = 3
theme.notification_border_color = "#5e81ac"
theme.notification_border_width = 2
theme.notification_shape = "rectangle"
theme.notification_opacity = 0.6

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."nord/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."theme/nord/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."theme/nord/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."theme/nord/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."theme/nord/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."theme/nord/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."theme/nord/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."theme/nord/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."theme/nord/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."theme/nord/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."theme/nord/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."theme/nord/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."theme/nord/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."theme/nord/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."theme/nord/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."theme/nord/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."theme/nord/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."theme/nord/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."theme/nord/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."nord/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."nord/titlebar/maximized_focus_active.png"

theme.wallpaper = themes_path.."theme/nord/nord-background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."theme/nord/layouts/fairh.png"
theme.layout_fairv = themes_path.."theme/nord/layouts/fairv.png"
theme.layout_floating  = themes_path.."theme/nord/layouts/floating.png"
theme.layout_magnifier = themes_path.."theme/nord/layouts/magnifier.png"
theme.layout_max = themes_path.."theme/nord/layouts/max.png"
theme.layout_fullscreen = themes_path.."theme/nord/layouts/fullscreen.png"
theme.layout_tilebottom = themes_path.."theme/nord/layouts/tilebottom.png"
theme.layout_tileleft   = themes_path.."theme/nord/layouts/tileleft.png"
theme.layout_tile = themes_path.."theme/nord/layouts/tile.png"
theme.layout_tiletop = themes_path.."theme/nord/layouts/tiletop.png"
theme.layout_spiral  = themes_path.."theme/nord/layouts/spiral.png"
theme.layout_dwindle = themes_path.."theme/nord/layouts/dwindle.png"
theme.layout_cornernw = themes_path.."theme/nord/layouts/cornernw.png"
theme.layout_cornerne = themes_path.."theme/nord/layouts/cornerne.png"
theme.layout_cornersw = themes_path.."theme/nord/layouts/cornersw.png"
theme.layout_cornerse = themes_path.."theme/nord/layouts/cornerse.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "Papirus-Dark"

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
