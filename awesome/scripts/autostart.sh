#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

run picom --animations -b --config ~/.config/awesome/scripts/picom.conf
run fcitx5
run nitrogen --restore
run /usr/lib/xfce-polkit/xfce-polkit
run keepassxc
run rclone --vfs-cache-mode writes mount "PikPak": ~/PikPak
