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


## Environment 
while [ -n "$1" ]; do
	case "${1}" in
		all)
			restartDunst
			;;
		dunst )
			restartDunst
			;;
		--help | -h)
			printHelp
			;;
	esac
	shift
done
