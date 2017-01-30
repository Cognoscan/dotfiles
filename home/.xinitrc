#!/bin/bash

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb -merge .XCustom
xrdb -merge ~/.XColorSchemes/hexrainbow &
xset -b &
xmodmap ~/.xmodmaprc &
redlocal &

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx &

if [ -n "$DISPLAY" ]; then
  BROWSER=firefox
fi

# Start Pulseaudio
start-pulseaudio-x11

#wmname LG3D &

uxterm &
firefox &
pavucontrol &
thunderbird &

#ssh-agent ~/scripts/startdwm.sh
#ssh-agent ~/scripts/start_xmonad.sh
#ssh-agent ~/scripts/start_i3.sh
exec i3
