#!/bin/bash

# Configuration file path
config_file="$HOME/.config/cava/config"

# Characters used for the visualizer bars
dict=" ▂▃▄▅▆▇█"

# Check if CAVA is running, if not start it with the custom config
pkill -f "cava -p $config_file"

cava -p "$config_file" | while read -r line; do
    # Translate numbers/characters from cava output into unicode bars
    output=""
    for ((i=0; i<${#line}; i++)); do
        char="${line:i:1}"
        if [[ "$char" =~ [0-9] ]]; then
            output+="${dict:char:1}"
        else
            output+="$char"
        fi
    done
    echo "$output"
done
