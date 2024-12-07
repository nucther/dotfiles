#!/bin/bash

xrandr --output eDP-1 --primary --mode 1920x1200 --pos 3000x0 --rotate normal --output HDMI-1 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --off --output DP-6 --off --output DP-7 --mode 1920x1080 --pos 1080x0 --rotate normal --output DP-8 --mode 1920x1080 --pos 0x0 --rotate left

dunst & disown
flameshot & disown

