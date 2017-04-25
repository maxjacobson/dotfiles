setxkbmap -option ctrl:nocaps
dropbox-cli start
xautolock -time 5 -locker slock -secure &
xsetroot -cursor_name left_ptr

sh ~/.fehbg &
xrandr --output eDP1 --mode 1920x1080
dunst &

plugged_in_checker &

exec xmonad
