#!/usr/bin/env bash

## Copyright (C) 2020-2024 Aditya Shakya <adi1090x@gmail.com>

# Import Current Theme
theme="~/.config/rofi/theme/askpass.rasi"

# Rofi text dialog to get password
rofi -dmenu \
     -password \
     -i \
     -p "Root" \
     -theme ${theme}
