#!/usr/bin/env bash

cliphist list | rofi -dmenu -theme ~/.config/rofi/theme/greenclip.rasi | cliphist decode | wl-copy
