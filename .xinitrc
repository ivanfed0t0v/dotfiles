#! /bin/bash
sh ~/.fehbg &
setxkbmap -layout us,ru -option grp:alt_shift_toggle
gxkb &
exec i3
