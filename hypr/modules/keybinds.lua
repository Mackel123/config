local mainMod         = "MOD4"
local altMod         = "MOD1"
local shift           = "SHIFT"
local ctrl            = "CTRL"
local bind            = hl.bind
local dsp             =  hl.dsp

--my programs
local terminal        = "kitty"
local filemagaer      = "pcmanfm-qt"
local browser         = "firefox"
local menu            = "~/.config/rofi/bin/launcher.sh"
--------------
---keybinds---
--------------
--systemkey
bind( altMod ..  " + space",      dsp.exec_cmd(menu))
bind( mainMod .. " + Return",     dsp.exec_cmd(terminal))
bind( mainMod .. " +SHIFT + g",   dsp.exec_cmd(filemagaer))
bind( mainMod .. " + w",          dsp.exec_cmd(browser))
bind( mainMod .. " + c",          dsp.window.close())
bind( mainMod .. " + SHIFT + c",  dsp.window.kill())
bind( mainMod .. " + space",      dsp.window.float( "toggle"))
bind( mainMod .. " + j",          dsp.layout( "togglesplit"))
bind( mainMod .. " + SHIFT + Q",  dsp.exit( ))
--move window keybinds
bind( mainMod .. " + H", dsp.focus({ direction = "left" }))
bind( mainMod .. "+ L", dsp.focus({ direction = "right" }))
bind( mainMod .. " + J", dsp.focus({ direction = "up" }))
bind( mainMod .. " + K", dsp.focus({ direction = "down" }))
--cycle focus keybinds
bind( altMod .." + Tab", dsp.window.cycle_next())
bind( altMod .." + SHIFT + Tab", dsp.window.cycle_next())
--switch workspace + [0-9]
--move active window to workspace + [0-0]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    bind(mainMod .. " + " .. key,             dsp.focus({ workspace = i}))
    bind(mainMod .. " + SHIFT + " .. key,     dsp.window.move({ workspace = i }))
end
-- Scroll through existing workspaces with mainMod + scroll
bind(mainMod .. " + mouse_down", dsp.focus({ workspace = "e+1" }))
bind(mainMod .. " + mouse_up",   dsp.focus({ workspace = "e-1" }))
-- Move/resize windows with mainMod + LMB/RMB and dragging
bind(mainMod .. " + mouse:272", dsp.window.drag(),   { mouse = true })
bind(mainMod .. " + mouse:273", dsp.window.resize(), { mouse = true })
--multimedia key
bind("XF86AudioRaiseVolume", dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
bind("XF86AudioLowerVolume", dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
--move window keybinds
bind( mainMod.. "+ CTRL + Left " , dsp.window.move({ direction = "left" , group_aware = true}))
bind( mainMod.. "+ CTRL + Right", dsp.window.move({ direction = "right" , group_aware = true}))
bind( mainMod.. "+ CTRL + Up", dsp.window.move({ direction = "up" , group_aware = true}))
bind( mainMod.. "+ CTRL + Down", dsp.window.move({ direction = "down" , group_aware = true}))
--move window floating keybinds
bind( mainMod.. "+left" , dsp.window.move({ x=-40, y=0, relative=true }, {repeating = true}))
bind( mainMod.. "+right" , dsp.window.move({ x=40, y=0, relative=true }, {repeating = true}))
bind( mainMod.. "+up" , dsp.window.move({ x=0, y=-40, relative=true }, {repeating = true}))
bind( mainMod.. "+down" , dsp.window.move({ x=0, y=40, relative=true }, {repeating = true}))
--swap window keybinds
bind( mainMod.. "+ Tab", dsp.window.swap({ next = true}))
bind( mainMod.. "+ SHIFT + Tab", dsp.window.swap({ next = true}))
--resize window keybinds
local resize = dsp.window.resize
local left   = { x=-10,   y=0,      relative=true }
local right  = { x=10,    y=0,      relative=true }
local up     = { x=0,     y=10,     relative=true }
local down   = { x=0,     y=-10,    relative=true }
bind(mainMod.."+ SHIFT + left",  resize(left))
bind(mainMod.."+ SHIFT + right", resize(right))
bind(mainMod.."+ SHIFT + up",    resize(up))
bind(mainMod.."+ SHIFT + down",  resize(down))


--programkey
bind( mainMod.." +SHIFT + e ", dsp.exec_cmd("code"))
bind( mainMod.." +SHIFT + a ", dsp.exec_cmd("openzoonz"))
bind( mainMod.." +SHIFT + b ", dsp.exec_cmd("blender"))

--tui app keybinds
bind(" CTRL + ALT + A ", dsp.exec_cmd( "kitty -e nvtop" ))
bind(" CTRL + ALT + b ", dsp.exec_cmd( "kitty -e btop" ))
bind(" CTRL + ALT + d ", dsp.exec_cmd( "kitty -e dgop" ))
bind(" CTRL + ALT + g ", dsp.exec_cmd( "kitty -e ncmpcpp" ))
bind(" CTRL + ALT + h ", dsp.exec_cmd( "kitty -e htop" ))
bind(" CTRL + ALT + k ", dsp.exec_cmd( "kitty -e kew" ))
bind(" CTRL + ALT + m ", dsp.exec_cmd( "kitty -e musicfox" ))
bind(" CTRL + ALT + n ", dsp.exec_cmd( "kitty -e nvim" ))
bind(" CTRL + ALT + r ", dsp.exec_cmd( "kitty -e ranger" ))
bind(" CTRL + ALT + v ", dsp.exec_cmd( "kitty -e vim" ))
bind(" CTRL + ALT + y ", dsp.exec_cmd( "kitty -e yazi" ))
bind(" CTRL + ALT + s ", dsp.exec_cmd( "vsfetch" ))
bind(" CTRL + ALT + c ", dsp.exec_cmd( "kitty -e veet" ))
bind(" CTRL + ALT + q ", dsp.exec_cmd("qutebrowser"))
--rofi keybinds
bind( mainMod.." + M", dsp.exec_cmd( "~/.config/rofi/bin/mpd.sh" ))
bind( mainMod.." + X", dsp.exec_cmd( "~/.config/rofi/bin/powermenu.sh" ))
bind( mainMod.." + G", dsp.exec_cmd( "~/.config/niri/scripts/clip.sh" ))
bind( mainMod.." + N", dsp.exec_cmd( "networkmanager_dmenu" ))
bind( mainMod.." + S", dsp.exec_cmd( "~/.config/rofi/bin/screenshot.sh" ))
--hyprshot keybinds
bind("Print", dsp.exec_cmd("hyprshot -m region"))
bind(ctrl.. "+ Print", dsp.exec_cmd("hyprshot -m output"))
bind(altMod.."+ Print", dsp.exec_cmd("hyprshot -m window"))
--lockscreen keybinds
bind( ctrl.." + L", dsp.exec_cmd( "hyprlock" ))
