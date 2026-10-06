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
	option_1=" Shot Region"
	option_2=" Shot Fullscreen"
	option_3=" Record Region"
	option_4="󰑋 Record Fullscreen"
	option_5="󰑊 Record Stop"
	option_6="󱄺 OCR"
else
	option_1=" "
	option_2=" "
	option_3=" "
	option_4="󰑋 "
	option_5="󰑊 "
	option_6="󱄺 "
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
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | rofi_cmd
}

# screenshot 
shotregion () {
	ncaptura screenshot region
}

shotfullscreen () {
	ncaptura screenshot fullscreen
}

recordregion () {
	ncaptura record start region --audio
}

recordfullscreen () {
	ncaptura record start fullscreen --audio
}

recordstop () {
	ncaptura record stop
}

ocr (){
	ncaptura ocr
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		shotregion
	elif [[ "$1" == '--opt2' ]]; then
		shotfullscreen
	elif [[ "$1" == '--opt3' ]]; then
	  recordregion
	elif [[ "$1" == '--opt4' ]]; then
		recordfullscreen
	elif [[ "$1" == '--opt5' ]]; then
		recordstop
	elif [[ "$1" == '--opt6' ]]; then
		ocr
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
		$option_6)
		run_cmd --opt6
		    ;;
esac


