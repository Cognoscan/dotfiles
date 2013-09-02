#!/bin/bash

padsp conky | while read -r; do xsetroot -name "$REPLY"; done
