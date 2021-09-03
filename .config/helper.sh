#!/bin/sh

## Run Dunst
restartDunst(){
	killall -q dunst
	dunst -c ~/.config/dunst/dunstrc &
}


printHelp(){
	echo "Helper for Window Manager"
	echo "usage:"
	echo "$HOME/.config/helpper.sh [options]"
	echo "Options: "
	echo "dunst          restart dunst"
}

setMonitor(){
	total=$(xrandr | grep -w -c connected)

	if [ $total == 2 ] ; then 
		xrandr --output eDP-1 --primary --mode 1366x768 --pos 1600x0 --rotate normal --output HDMI-1 --off --output DP-1 --mode 1600x900 --pos 0x0 --rotate normal --output HDMI-2 --off
	else 
		xrandr --output eDP-1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output HDMI-1 --off --output HDMI-2 --off --output DP-1 --off
	fi

}

## Environment 
while [ -n "$1" ]; do
	case "${1}" in
		all)
			setMonitor
			restartDunst
			;;
		dunst )
			restartDunst
			;;
		monitor )
			setMonitor
			;;
		--help | -h)
			printHelp
			;;
	esac
	shift
done
