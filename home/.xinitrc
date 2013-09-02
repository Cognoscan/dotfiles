#!/bin/bash

xrdb -merge .XResources &

if [ -n "$DISPLAY" ]; then
  BROWSER=google-chrome
fi

feh --bg-fill ~/Pictures/backgrounds/Anime/Ghost\ in\ the\ Shell\ 2.jpg &

~/scripts/dwmstatus.sh &

~/scripts/startdwm.sh

