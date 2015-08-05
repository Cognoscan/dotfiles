#!/bin/bash

start-pulseaudio-x11

#while true;
#do
LC_TIME=ja_JP.utf8 padsp conky | while read -r; do xsetroot -name "$REPLY"; done
#done
