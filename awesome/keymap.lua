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

modkey = "Mod4"

-- General Awesome keys
awful.keyboard.append_global_keybindings({
    awful.key({ "Mod1",           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ "Mod1",           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),
    awful.key({ "Shift", "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ "Shift", "Control"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    awful.key({ "Mod1" }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ "Mod1" },            "r",     function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"}),
    awful.key({ "Mod1" },               "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"}),
})

--Volume keymap
awful.keyboard.append_global_keybindings({
awful.key({ }, "XF86AudioPlay", function () awful.util.spawn("mpc toggle") end,
         {description = "mpc toggle" , group = "mpd service"}),
awful.key({"Control" }, "n", function () awful.util.spawn("mpc next") end,
         {description = "mpc next" , group = "mpd service"}),
awful.key({"Control" }, "p", function () awful.util.spawn("mpc prev") end,
         {description = "mpc prev", group  = "mpd service"}),
awful.key({ }, "XF86AudioRaiseVolume", function () awful.util.spawn("pactl set-sink-volume 0 +5%") end,
         {description = "increase volume", group = "alsa control"}),
awful.key({ }, "XF86AudioLowerVolume", function () awful.util.spawn("pactl set-sink-volume 0 -5%") end,
         {description = "decrease volume", group = "alsa control"}),
awful.key({ }, "XF86AudioMute", function () awful.util.spawn("pactl set-sink-mute 0 toggle") end,
         {description = "mute/unmute toggle", group = "alsa control"}),
--lockscreen
awful.key({"Control" , "Mod1" }, "l", function () awful.util.spawn("/usr/bin/i3lock-fancy-dualmonitor") end,
        {description = "lockscreen", group = "client"}),
--networkmanager
awful.key({modkey , "Mod1" }, "n", function () awful.util.spawn("networkmanager_dmenu") end,
        {description = "networkmanager", group = "client"}),


--Application keymap
awful.key({"Control", modkey }, "w", function () awful.util.spawn("firefox") end,
         {description = "open firefox", group  = "application"}),
awful.key({"Control", modkey }, "q", function () awful.util.spawn("qutebrowser") end,
         {description = "open qutebrowser", group = "application"}),
awful.key({"Control", modkey }, "f", function () awful.util.spawn("thunar") end,
         {description = "open thunar", group = "application"}),
awful.key({"Control", modkey }, "e", function () awful.util.spawn("geany") end,
         {description = "open geany", group = "application"}),
awful.key({"Control", modkey }, "v", function () awful.util.spawn("vlc") end,
         {description = "open vlc", group = "application"}),
awful.key({"Control", modkey }, "k", function () awful.util.spawn("kdenlive") end,
         {description = "open kdenlive", group = "application"}),
awful.key({"Control", modkey }, "o", function () awful.util.spawn("Opentoonz") end,
         {description = "open Opentoonz", group = "application"}),
awful.key({"Control", modkey }, "b", function () awful.util.spawn("blender") end,
         {description = "open blender", group = "application"}),

--tuiapplication
awful.key({"Control", "Mod1"}, "m", function () awful.util.spawn("kitty -e musicfox") end,
        {description = "open musicfox with kitty", group = "TUI Application"}),
awful.key({"Control", "Mod1"}, "h", function () awful.util.spawn("kitty -e htop") end,
        {description = "open htop with kitty", group = "TUI Application"}),
awful.key({"Control", "Mod1"}, "b", function () awful.util.spawn("kitty -e btop") end,
        {description = "open btop with kitty", group = "TUI Application"}),
awful.key({"Control", "Mod1"}, "v", function () awful.util.spawn("kitty -e vim") end,
        {description = "open vim with kitty", group = "TUI Application"}),
awful.key({"Control", "Mod1"}, "n", function () awful.util.spawn("kitty -e nvim") end,
        {description = "open neovim with kitty", group = "TUI Application"}),
awful.key({"Control", "Mod1"}, "r", function () awful.util.spawn("kitty -e ranger") end,
        {description = "open ranger with kitty", group = "TUI Application"}),
awful.key({"Control", "Mod1"}, "y", function () awful.util.spawn("kitty -e yazi") end,
        {description = "open yazi with kitty", group = "TUI Application"}),


--rofi
awful.key({modkey, }, "s", function () awful.util.spawn_with_shell("~/.config/rofi/bin/screenshot.sh") end,
        {description = "screenshot", group = "rofi"}),
awful.key({modkey, }, "x", function () awful.util.spawn_with_shell("~/.config/rofi/bin/powermenu.sh") end,
        {description = "powermenu", group = "rofi"}),
awful.key({modkey, }, "r", function () awful.util.spawn_with_shell("~/.config/rofi/bin/asroot.sh") end,
        {description = "asroot", group = "rofi"}),
awful.key({modkey, }, "b", function () awful.util.spawn_with_shell("~/.config/rofi/bin/mpd.sh") end,
        {description = "mpd", group = "rofi"}),
awful.key({modkey, }, "v", function () awful.util.spawn_with_shell("~/.config/rofi/bin/volume.sh") end,
        {description = "volume", group = "rofi"}),
awful.key({modkey, }, "p", function () awful.util.spawn_with_shell("~/.config/rofi/bin/launcher.sh") end,
        {description = "launcher", group = "rofi"}),
awful.key({modkey, }, "g", function () awful.util.spawn_with_shell("~/.config/rofi/bin/greenclip.sh") end,
        {description = "copyclip", group = "rofi"}),

--screenshot keymap
awful.key({ }, "Print", function () awful.util.spawn_with_shell("~/.config/awesome/scripts/screenshot.sh --now") end,
        {description = "screenshot now", group = "screenshot"}),
awful.key({modkey, }, "Print", function () awful.util.spawn_with_shell("~/.config/awesome/scripts/screenshot.sh --win") end,
        {description = "screenshot windows", group = "screenshot"}),
awful.key({"Control", }, "Print", function () awful.util.spawn_with_shell("~/.config/awesome/scripts/screenshot.sh --area") end,
        {description = "screenshot area", group = "screenshot"}),
awful.key({"Control","Mod1" }, "Print", function () awful.util.spawn_with_shell("~/.config/awesome/scripts/screenshot.sh --in5") end,
        {description = "screenshot in 5s", group = "screenshot"}),
awful.key({"Control", "Shift"}, "Print", function () awful.util.spawn_with_shell("~/.config/awesome/scripts/screenshot.sh --in10") end,
        {description = "screenshot in 10s", group = "screenshot"}),

})

-- Tags related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),
})

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:activate { raise = true, context = "key.unminimize" }
                  end
              end,
              {description = "restore minimized", group = "client"}),
})

-- Layout related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),
})


awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numrow",
        description = "only view tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },
    awful.key {
        modifiers   = { modkey, "Control" },
        keygroup    = "numrow",
        description = "toggle tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },
    awful.key {
        modifiers = { modkey, "Shift" },
        keygroup    = "numrow",
        description = "move focused client to tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { modkey, "Control", "Shift" },
        keygroup    = "numrow",
        description = "toggle focused client on tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numpad",
        description = "select layout directly",
        group       = "layout",
        on_press    = function (index)
            local t = awful.screen.focused().selected_tag
            if t then
                t.layout = t.layouts[index] or t.layout
            end
        end,
    }
})
client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button({ }, 1, function (c)
            c:activate { context = "mouse_click" }
        end),
        awful.button({ modkey }, 1, function (c)
            c:activate { context = "mouse_click", action = "mouse_move"  }
        end),
        awful.button({ modkey }, 3, function (c)
            c:activate { context = "mouse_click", action = "mouse_resize"}
        end),
    })
end)

client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
        awful.key({ modkey,           }, "f",
            function (c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
            {description = "toggle fullscreen", group = "client"}),
        awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
                {description = "close", group = "client"}),
        awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
                {description = "toggle floating", group = "client"}),
        awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
                {description = "move to master", group = "client"}),
        awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
                {description = "move to screen", group = "client"}),
        awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
                {description = "toggle keep on top", group = "client"}),
        awful.key({ modkey,           }, "n",
            function (c)
                -- The client currently has the input focus, so it cannot be
                -- minimized, since minimized clients can't have the focus.
                c.minimized = true
            end ,
            {description = "minimize", group = "client"}),
        awful.key({ modkey,           }, "m",
            function (c)
                c.maximized = not c.maximized
                c:raise()
            end ,
            {description = "(un)maximize", group = "client"}),
        awful.key({ modkey, "Control" }, "m",
            function (c)
-- Layout related keybindings
-- Layout related keybindings
                c.maximized_vertical = not c.maximized_vertical
                c:raise()
            end ,
            {description = "(un)maximize vertically", group = "client"}),
        awful.key({ modkey, "Shift"   }, "m",
            function (c)
                c.maximized_horizontal = not c.maximized_horizontal
                c:raise()
            end ,
            {description = "(un)maximize horizontally", group = "client"}),
    })
end)


