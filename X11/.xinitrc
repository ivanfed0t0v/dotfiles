#! /bin/bash
sh ~/.fehbg &
setxkbmap -layout us,ru -option grp:alt_shift_toggle
gxkb &
systemctl --user import-environment DISPLAY
sh ~/bin/monitor_hotplug.sh &

exec i3
