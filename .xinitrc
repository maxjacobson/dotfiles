setxkbmap -option ctrl:nocaps
dropbox-cli start
dunst &
xautolock -time 5 -locker slock -secure &
xsetroot -cursor_name left_ptr
sh ~/.fehbg &
xrandr --output eDP1 --mode 1920x1080
exec xmonad
