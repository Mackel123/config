#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x
#
## Applets : Screenshot

# Import Current Theme
theme='~/.config/rofi/theme/screen.rasi'

# Theme Elements
prompt='Screenshot'

# Options
layout=`cat ${theme} | grep 'USE_ICON' | cut -d'=' -f2`
if [[ "$layout" == 'NO' ]]; then
	option_1="󰢹 Capture Desktop"
	option_2=" Capture Area"
	option_3=" Capture Window"
	option_4="󰔝 Capture in 5s"
	option_5="󰔜 Capture in 10s"
else
	option_1="󰢹 "
	option_2=" "
	option_3=" "
	option_4="󰔝 "
	option_5="󰔜 "
fi

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "$prompt" \
		-markup-rows \
		-theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5" | rofi_cmd
}

#file
dir="$HOME/Pictures/Screenshots"
file="Screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"

# directory
if [[ ! -d "$dir" ]]; then
	mkdir -p "$dir"
fi

# notify and view screenshot
notify () {
	notify-send -a "Screenshot" "Screenshot Saved." -i "$dir/$file"
	paplay /usr/share/sounds/freedesktop/stereo/screen-capture.oga &>/dev/null &
}

# screenshot 
shotnow () {
  grim  "$dir"/"$file"
	notify
}

shotwin () {
	grim -g "$(swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')" ${dir}/${file}
	notify
}

shotregion () {
 grim -g "$(slurp)" $dir/$file
	notify
}

shot3sec () {
	sleep 3;grim $dir/$file
	notify
}

shot10sec () {
	sleep 10;grim $dir/$file
	notify
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		shotnow
	elif [[ "$1" == '--opt2' ]]; then
		shotregion
	elif [[ "$1" == '--opt3' ]]; then
		shotwin
	elif [[ "$1" == '--opt4' ]]; then
		shot3sec
	elif [[ "$1" == '--opt5' ]]; then
		shot10sec
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
		run_cmd --opt1
        ;;
    $option_2)
		run_cmd --opt2
        ;;
    $option_3)
		run_cmd --opt3
        ;;
    $option_4)
		run_cmd --opt4
        ;;
    $option_5)
		run_cmd --opt5
        ;;
esac


