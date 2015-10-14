xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5
xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Constant Deceleration" 0.75

synclient TouchPadOff=1

gps_redshift
xrdb ~/.Xdefaults
sh ~/.fehbg &
xmodmap ~/.xmodmap
xbindkeys -f .xbindkeysrc
xsetroot -cursor_name left_ptr
setxkbmap -layout is
exec xmonad
unclutter -idle 5 &
compton -b &
