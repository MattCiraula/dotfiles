# set caps lock to be escape when hit alone and ctrl when pressed with another key
setxkbmap -option caps:ctrl_modifier
xcape -e 'Caps_Lock=Escape'

# change default curser shape from x to arrow
xsetroot -cursor_name left_ptr

# start compositor
picom -b &

# set background
fehbg &

# start dwm bar script
killall dwmbar; dwmbar &

# start pipewire
/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/pipewire-media-session &

# make java GUIs play nicely with tiling
export AWT_TOOLKIT=MToolkit
export _JAVA_AWT_WM_NONREPARENTING=1
wmname compiz

# start dwm
exec dwm 
