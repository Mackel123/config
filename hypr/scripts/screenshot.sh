#!/usr/bin/env bash

#screenshot

shotwin () {
	hyprshot -zm window
  paplay /usr/share/sounds/freedesktop/stereo/screen-capture.oga
}

shotregion () {
	hyprshot -zm region
  paplay /usr/share/sounds/freedesktop/stereo/screen-capture.oga
}

shotnow () {
	hyprshot -m output
  paplay /usr/share/sounds/freedesktop/stereo/screen-capture.oga
}

shot3sec () {
	sleep 3; hyprshot -m output
  paplay /usr/share/sounds/freedesktop/stereo/screen-capture.oga
}

shot10sec () {
	sleep 10; hyprshot -m output
	paplay /usr/share/sounds/freedesktop/stereo/screen-capture.oga
}

#execute
if [ $1 = "now" ]; then
	shotnow
elif [ $1 = "win" ]; then
	shotwin
elif [ $1 = "region" ]; then
	shotregion
elif [ $1 = "shot3sec" ]; then
	shot3sec
elif [ $1 = "shot10sec" ]; then
	shot10sec
fi

