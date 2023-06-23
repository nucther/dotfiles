#!/bin/bash
sleep 1
width=$(tput cols)
height=$(tput lines)

starthpos(){
    fLine=6
    num_lines=$1
    cheight=$((height/2))
    hpos=$(( (fLine * num_lines) / 2))

    cpos=$(($cheight - hpos))

    echo "$cpos"
}



lines=2
spos=$(starthpos $lines)
while true; do 
    if read -r message < "$HOME/.pomodoro.pid"; then 
        tput clear
        tput cup $spos 0
        figlet -w $width -cn "Taking Break for"
        figlet -w $width -cn "$message"
        sleep 1
    else
        echo "Failed to read message"
        sleep 1
    fi
done

