pcall(require, "luarocks.loader")
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local ruled = require("ruled")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

--freedesktop
local freedesktop = require("freedesktop")

--lain-widget
local lain = require("lain")
local markup = lain.util.markup
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

mymainmenu = freedesktop.menu.build({ 
	  before = {
		   { "awesome", myawesomemenu, beautiful.awesome_icon },
	  },
    after  = {
		   {  "open terminal", terminal },
		   {   "File Manager", pcmanfm  },
    },
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Tag layout
-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.floating,
        awful.layout.suit.tile,
        awful.layout.suit.tile.left,
        awful.layout.suit.tile.bottom,
        awful.layout.suit.tile.top,
        awful.layout.suit.fair,
        awful.layout.suit.fair.horizontal,
        awful.layout.suit.spiral,
        awful.layout.suit.spiral.dwindle,
        awful.layout.suit.max,
        awful.layout.suit.max.fullscreen,
        awful.layout.suit.magnifier,
        awful.layout.suit.corner.nw,
    })
end)
-- }}}

-- {{{ Wallpaper
screen.connect_signal("request::wallpaper", function(s)
    awful.wallpaper {
        screen = s,
        widget = {
            {
                image     = beautiful.wallpaper,
                upscale   = true,
                downscale = true,
                widget    = wibox.widget.imagebox,
            },
            valign = "center",
            halign = "center",
            tiled  = false,
            widget = wibox.container.tile,
        }
    }
end)
-- }}}

-- {{{ Wibar

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- {{{
local alsavolume = lain.widget.alsa({
	timeout = 3,
	settings = function()
	    widget:set_markup(markup.fontfg("JetBrainsMonoNL Nerd Font", "#b48ead", " " .. volume_now.level .."%" ))
	end
})

local mycpu = lain.widget.cpu({
	timeout = 2,
	settings = function ()
           widget:set_markup(markup.fontfg("JetBrainsMonoNL Nerd Font", "#bf616a", "󰻠 " .. cpu_now.usage .."%"))
	end
})

local mymem = lain.widget.mem({
	timeout = 2,
	settings = function ()
	   widget:set_markup(markup.fontfg("JetBrainsMonoNL Nerd Font", "#d08770", "  " .. mem_now.used .. " MiB"))
	end
})

local myweather = lain.widget.weather({
	APPID = "787cfe8acf0dcafc7f9c57c72bbfe89f",
	timeout = 800,
	city_id = "1795565",
	settings = function ()
	   descr = weather_now["weather"][1]["description"]:lower()
           units = math.floor(weather_now["main"]["temp"])
	   widget:set_markup(markup.fontfg("JetBrainsMonoNL Nerd Font", "#eceff4", " "..descr.." "..units.." "))
	end

})

local mynetup = lain.widget.net({
	iface = enp4s0,
	units = 1024^3,
	eth_state = "on",
	settings = function ()
	   widget:set_markup(markup.fontfg("JetBrainsMonoNL Nerd Font", "#5e81ac", " " .. net_now.sent .."MiB ") .. markup.fontfg("JetBrainsMonoNL Nerd Font", "#ebcb8b", " " .. net_now.received .."MiB "))
	end
})

local mympd = lain.widget.mpd({
	timeout = 3,
	followtag = true,
	music_dir = "~/disk/Music",
	settings = function ()
	   mpd_notification_preset = {
                   title   = "Now playing",
                   timeout = 6,
                   text    = string.format("%s (%s) - %s\n%s", mpd_now.artist,
                             mpd_now.album, mpd_now.date, mpd_now.title)
                   }
              if mpd_now.state == "play" then
                  artist = " " .. mpd_now.artist .. " "
                  title  = mpd_now.track  .. " "
              elseif mpd_now.state == "pause" then
                  artist = " mpd "
                  title  = "paused "
              else
                  artist = ""
                  title  = ""
              end
	    widget:set_markup(markup.fontfg("JetBrainsMonoNL Nerd Font", "#3b4252",artist)..markup.fontfg("JetBrainsMonoNL Nerd Font", "#5e81ac",title))
	end
})

--separator
tbox_separator = wibox.widget.textbox(" | ")
l_sep = wibox.widget.textbox(" [ ")
m_sep = wibox.widget.textbox(" ][ ")
r_sep = wibox.widget.textbox(" ] ")

screen.connect_signal("request::desktop_decoration", function(s)
    -- Each screen has its own tag table.
    awful.tag({ "   ","   ", "   ","   ", " 󰏆  ", "   ", " 󰕧  ", " 󰨜  ", "   " }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox {
        screen  = s,
        buttons = {
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end),
            awful.button({ }, 4, function () awful.layout.inc(-1) end),
            awful.button({ }, 5, function () awful.layout.inc( 1) end),
        }
    }

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = {
            awful.button({ }, 1, function(t) t:view_only() end),
            awful.button({ modkey }, 1, function(t)
                                            if client.focus then
                                                client.focus:move_to_tag(t)
                                            end
                                        end),
            awful.button({ }, 3, awful.tag.viewtoggle),
            awful.button({ modkey }, 3, function(t)
                                            if client.focus then
                                                client.focus:toggle_tag(t)
                                            end
                                        end),
            awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
            awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
        }
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = {
            awful.button({ }, 1, function (c)
                c:activate { context = "tasklist", action = "toggle_minimization" }
            end),
            awful.button({ }, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
            awful.button({ }, 4, function() awful.client.focus.byidx(-1) end),
            awful.button({ }, 5, function() awful.client.focus.byidx( 1) end),
        }
    }

    -- Create the wibox
    s.mywibox = awful.wibar {
        position = "top",
        screen   = s,
	bg = beautiful.bg_normal .. "0",
	      height = 20,
        widget   = {
        layout = wibox.layout.align.horizontal,
            { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
            },
            s.mytasklist, -- Middle widget
            { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
		        l_sep,
            mykeyboardlayout,
		        m_sep,
            wibox.widget.systray(),
	          m_sep,
	          mynetup,
	          m_sep,
	          alsavolume,
	          m_sep,
	          myweather,
	          m_sep,
	          mycpu,
	          m_sep,
	          mymem,
	          m_sep,
	          wibox.container.background(mympd,"#a3be8c"),
            m_sep,
		        mytextclock,
		        mr_sep,
            s.mylayoutbox,
            },
        }
    }
end)

