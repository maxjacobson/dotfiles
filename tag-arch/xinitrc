xmodmap ~/.Xmodmap
dropbox-cli start

xautolock \
  -time 10 \
  -locker slock \
  -notifier "notify-send --expire-time=30000 'locking shortly...'" \
  -notify 30 \
  -secure &

xsetroot -cursor_name left_ptr

shuffle_wallpapers &

dunst &

plugged_in_checker &

exec xmonad
