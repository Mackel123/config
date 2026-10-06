#!/bin/bash

# Path to your wallpaper folder
WP_FOLDER="$HOME/Pictures/Wallpaper"

# Time to wait in seconds (e.g., 600 seconds = 10 minutes)
WAIT_TIME=600

while true; do
    # Pick a random image from the folder
    NEW_WP=$(find "$WP_FOLDER" -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)
    
    # Start new swaybg instance
    swaybg -i "$NEW_WP" -m fill &
    
    # Wait for the old swaybg process to be identified and killed
    sleep 1
    kill $OLD_PID 2>/dev/null
    
    # Save current PID as old PID for the next cycle
    OLD_PID=$!
    
    # Wait for the specified time interval
    sleep "$WAIT_TIME"
done
