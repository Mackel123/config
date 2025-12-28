#!/usr/bin/env bash

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

# copy screenshot to clipboard

# screenshot 
shotnow () {
  grim  "$dir/$file" 
	wl-copy < "$dir/$file"
	notify
}

shotwin () {
	grim -g "$(swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')" "$dir/$file"
	wl-copy < "$dir/$file"
	notify
}

shotregion () {
 grim -g "$(slurp)" "$dir/$file"
 wl-copy < "$dir/$file"
	notify
}

shot3sec () {
	sleep 3;grim "$dir/$file"
	wl-copy < "$dir/$file"
	notify
}

shot10sec () {
	sleep 10;grim "$dir/$file"
	wl-copy < "$dir/$file"
	notify
}

#execute
if [[ "$1" == "now" ]]; then
	shotnow
elif [[ "$1" == "win" ]]; then
	shotwin
elif [[ "$1" == "region" ]]; then
	shotregion
elif [[ "$1" == "3sec" ]]; then
	shot3sec
elif [[ "$1" == "10sec" ]]; then
	shot10sec
fi
	


