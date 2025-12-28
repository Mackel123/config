#!/usr/bin/env bash

theme="~/.config/rofi/theme/greenclip.rasi"

rofi -modi "clipboard:greenclip print" \
     -show clipboard \
		 -theme ${theme} 
