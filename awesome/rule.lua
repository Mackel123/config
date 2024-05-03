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

    -- Floating clients.
    ruled.client.append_rule {
        id       = "floating",
        rule_any = {
            instance = { "copyq", "pinentry" },
            class    = {
                "Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv",
                "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer",
								"thunar","Thunderbird","Viewnior", "lxappearance","lxtask",
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
         rule_any    = { class = {"firefox" ,"qutebrowser", "brave","floorp" }   },
         properties = { screen = 1, tag = "  " }
     }
	   ruled.client.append_rule {
         rule_any    = { class = {"Thunar" ,"pcmanfm-qt", "qbittorrent" }  },
         properties = { screen = 1, tag = "   " }
     }
	   ruled.client.append_rule {
         rule_any   = { class = {"Geany" ,"code"  } },
         properties = { screen = 1, tag = "   " }
     }
  	ruled.client.append_rule {
        rule_any   = { class = {"Gucharmap" ,"Atril" ,"Evince","Master PDF Editor", "libreoffice-writer", "libreoffice-calc",
			                 "libreoffice-impress", "libreoffice-startcenter", "libreoffice", "Soffice", "*:libreofficedev","*:soffice"} },
        properties = { screen = 1, tag = "  󰏆 " }
  	}
  	ruled.client.append_rule {
        rule_any   = { class = {"Thunderbird" ,"TelegramDesktop","Hexchat" ,"Discord" } },
        properties = { screen = 1, tag = "   " }
    }
    ruled.client.append_rule {
        rule_any   = { class = {"Audacity" ,"kdenlive","mpv","vlc" ,"Dopamine","deadbeef" ,"darktable" ,"HandBrake" ,"spotify", "RawTherapee" } },
        properties = { screen = 1, tag = " 󰕧 " }
    }
    ruled.client.append_rule {
        rule_any  = { class = {"Inkscape" ,"Gimp-2.10", "blender", "resolve" ,"Fusion", "kdenlive","REAPER" ,"krita" } },
        properties = { screen = 1, tag = " 󰨜 " }
    }
    ruled.client.append_rule {
        rule_any  = { class = {"VirtualBox Manager" ,"GParted","Lxappearance","Lxtask","Lxrandr","Exo-helper-1",
			                "Xfce4-power-manager-settings","Print Settings" ,"Power Manager" ,"Kvantum Manager" ,"qt5ct" , "qt6ct" ,"Pomatez" } },
        properties = { screen = 1, tag = "   " }
    }
end)
