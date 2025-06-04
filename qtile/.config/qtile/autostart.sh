#!/bin/bash

totalMonitor=$(xrandr | grep connected | grep -cEv disconnected)
listMonitor=$(xrandr | grep connected | grep -Ev disconnected | awk '{print $1}')

if [ "$totalMonitor" > 2 ]; then 
    echo "Multi Monitor"
    for x in $listMonitor; do
	res=$(xrandr | grep -A 1 $x | grep -Ev connected | awk '{print $1}')
	xrandr --output $x --mode $res --pos 0x0

	if [ "$x" == "HDMI-1" ]; then 
	    xrandr --output $x --rotate left --pos 0x0 --primary
	elif [ "$x" == "HDMI-2" ]; then 
	    xrandr --output $x --pos 1080x0 --primary
	fi
    done
else
    echo "Single Monitor"
    res=$(xrandr | grep -A 1 $listMonitor| grep -Ev connected | awk '{print $1}')
    echo $res
fi

flameshot & disown
nitrogen --restore &
