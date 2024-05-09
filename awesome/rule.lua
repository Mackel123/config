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

ruled.client.connect_signal("request::rules", function()
    ruled.client.append_rule {
        id         = "global",
        rule       = { },
        properties = {
            focus     = awful.client.focus.filter,
            raise     = true,
            screen    = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    }
	  ruled.client.append_rule {
		   id           = "corrent tiling window for mpv",
		   rule         ={class = "mpv" },
		   properties   =  { 
			      size_hints_honor = false,
			      border_width     = 5, 
			      border_color     = "#bf616a",
		   }
	  }

    -- Floating clients.
    ruled.client.append_rule {
        id       = "floating",
        rule_any = {
            instance = { "copyq", "pinentry" },
            class    = {
                "Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv","TelegramDesktop","Dopamine","HandBrake",
                "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer","Pavucontrol","discord","Artil","mpv","Audacity",
								"thunar","Thunderbird","Viewnior", "lxappearance","lxtask","vlc", "deadbeef","libreoffice-startcenter",
				        "Geany","firefox:firefox","firefox:Firefox"
            },
            name    = {
                "Event Tester",  -- xev.
            },
            role    = {
                "AlarmWindow",    -- Thunderbird's calendar.
                "ConfigManager",  -- Thunderbird's about:config.
                "pop-up",         -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = { floating = true }
    }

    -- Add titlebars to normal clients and dialogs
    ruled.client.append_rule {
        id         = "titlebars",
        rule_any   = { type = { "normal", "dialog" } },
        properties = { titlebars_enabled = false      }
    } 

    -- tag application map
     ruled.client.append_rule {
         rule_any    = { class = {"firefox" ,"qutebrowser", "brave", "floorp"  }   },
         properties = { screen = 1, tag = "   " }
     }
	   ruled.client.append_rule {
         rule_any    = { class = {"Thunar" ,"pcmanfm-qt", "qBittorrent" }  },
         properties = { screen = 1, tag = "   " }
     }
	   ruled.client.append_rule {
         rule_any   = { class = {"Geany" ,"code"  } },
         properties = { screen = 1, tag = "   " }
     }
  	ruled.client.append_rule {
        rule_any   = { class = {"Atril" , "masterpdfeditor4","LibreOffice", "Libreoffice Writer", "Libreoffice Calc",
			                 "Libreoffice Impress", "Libreoffice Startcenter",  "*:libreofficedev", "Soffice", "*:soffice"} },
        properties = { screen = 1, tag = " 󰏆  " }
  	}
  	ruled.client.append_rule {
        rule_any   = { class = {"thunderbird" ,"TelegramDesktop", "Discord" } },
        properties = { screen = 1, tag = "   " }
    }
    ruled.client.append_rule {
        rule_any   = { class = {"Audacity" , "mpv","Dopamine","Deadbeef" ,"Darktable" ,"HandBrake" ,"spotify", "RawTherapee" ,"vlc"} },
        properties = { screen = 1, tag = " 󰕧  " }
    }
    ruled.client.append_rule {
        rule_any  = { class = { "Inkscape" ,"Gimp-2.10", "Blender", "resolve" ," Fusion", "kdenlive","REAPER" ,"krita" ,"0penToonz"} },
        properties = { screen = 1, tag = " 󰨜  " }
    }
    ruled.client.append_rule {
        rule_any  = { class = {"VirtualBox Manager" ,"GParted","Lxappearance","Lxtask","Lxrandr","Exo-helper-1","Pavucontrol",
			                "Xfce4-power-manager-settings","Print Settings" ,"Power Manager" ,"Kvantum Manager" ,"qt5ct" , "qt6ct" ,"Pomatez" } },
        properties = { screen = 1, tag = "   " }
    }
end)

