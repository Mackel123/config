#!/usr/bin/env bash

theme="~/.config/rofi/theme/finder.rasi"

rofi -show find\
	-modi find:~/.config/rofi/scripts/finder.sh\
  -theme ${theme}
