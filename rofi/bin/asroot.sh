#!/usr/bin/env bash
## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x
#
## Applets : Run Applications as Root

# Import Current Theme
theme='~/.config/rofi/theme/asroot.rasi'
# Theme Elements
prompt='Applications'
mesg='Run Applications as Root'


# Options
layout=`cat ${theme} | grep 'USE_ICON' | cut -d'=' -f2`
	option_1="  Alacritty"
	option_2="  Thunar"
	option_3="󱥇  Geany"
	option_4="  Ranger"
	option_5="  Vim"

# Rofi CMD

rofi_cmd() {
	rofi -dmenu \
		-p "$prompt" \
		-mesg "$mesg" \
		-markup-rows \
		-theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5" | rofi_cmd
}

# Execute Command
run_cmd() {
	askpass="$HOME/.config/rofi/bin/awesomewm_askpass"
	if [[ "$1" == '--opt1' ]]; then
		${askpass} alacritty
	elif [[ "$1" == '--opt2' ]]; then
		${askpass} "dbus-run-session thunar"
	elif [[ "$1" == '--opt3' ]]; then
		${askpass} sgeany
	elif [[ "$1" == '--opt4' ]]; then
		${askpass} "alacritty -e ranger"
	elif [[ "$1" == '--opt5' ]]; then
		${askpass} "alacritty -e vim"
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

