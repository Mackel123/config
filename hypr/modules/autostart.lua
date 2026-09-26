hl.on("hyprland.start", function()
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("fcitx5")
	hl.exec_cmd("aria2c")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("mako")
	hl.exec_cmd("mpd-nitification")
	hl.exec_cmd("hyprpm reload -n")
	hl.exec_cmd("waybar -c ~/.config/hypr/waybar/config.jsonc -s ~/.config/hypr/waybar/style.css")
	hl.exec_cmd("localshare")
	hl.exec_cmd("playerctld daemon")
	hl.exec_cmd("localsend")
end)












