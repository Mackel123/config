#!/bin/bash
# Toggles Do Not Disturb mode in Mako

if [ "$(makoctl mode)" == "do-not-disturb" ]; then
  # If DND is on, turn it off (restore)
  makoctl mode -r do-not-disturb && notify-send "DND OFF"
else
  # If DND is off, turn it on (set)
  makoctl mode -s do-not-disturb && noyify-send "DND ON"
fi
