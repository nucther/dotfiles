#!/bin/sh

## Run Dunst
restartDunst(){
	killall -q dunst
	dunst -c ~/.config/dunst/dunstrc &
}

# Print help 
printHelp(){
	echo "Helper for Window Manager"
	echo "usage:"
	echo "$HOME/.config/helpper.sh [options]"
	echo "Options: "
	echo "dunst          restart dunst"
}

# Setup monitor resolution 
setMonitor(){
	total=$(xrandr | grep -w -c connected)

	if [ $total == 2 ] ; then 
		xrandr --output eDP-1 --primary --mode 1366x768 --pos 1600x0 --rotate normal --output HDMI-1 --off --output DP-1 --mode 1600x900 --pos 0x0 --rotate normal --output HDMI-2 --off
	else 
		xrandr --output eDP-1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output HDMI-1 --off --output HDMI-2 --off --output DP-1 --off
	fi

}

install(){
	stow bspwm sxhkd nvim kitty polybar dunst tmux
}

uninstall(){
	stow -D bspwm sxhkd nvim kitty polybar dunst tmux
}

## Environment 
while [ -n "$1" ]; do
	case "${1}" in
		all)
			restartDunst
			;;
		dunst )
			restartDunst
			;;
		monitor )
			setMonitor
			;;
		install | -i)
			install
			;;
		--help | -h)
			printHelp
			;;
	esac
	shift
done