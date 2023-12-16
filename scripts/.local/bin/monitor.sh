#!/bin/bash
#
#

help(){
    echo -e "Check status monitor for hyprland"
    echo -e "================================="
    echo -e "usage: checkmonitor.sh [options]"
    echo -e "options:"
    echo -e "--lid | -l [on/off]\tDisable or enable dpms"
    echo -e "--multi | -m\tDisplay in multi monitor"
}

brighness(){
    current=$(cat /sys/class/backlight/amdgpu_bl1/brightness)
    max=$(cat /sys/class/backlight/amdgpu_bl1/max_brightness)
    if [ "$1" == "up" ]; then 
        cnext=$((current + 10))
    else 
        cnext=$((current -10))
    fi

    if [ "$cnext" -gt "$max" ]; then 
        cnext=$((max))
    fi
    if [ "$cnext" -lt "0" ]; then 
        cnext=0
    fi
    echo "$cnext" | tee /sys/class/backlight/amdgpu_bl1/brightness
}

randomWallpaper(){
    wallpaper=$(ls ~/Pictures/Wallpaper | shuf -n 1 )

    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload "~/Pictures/Wallpaper/$wallpaper"

    for m in $(hyprctl monitors -j | jq -r '.[].name');
    do
        hyprctl hyprpaper wallpaper "$m,~/Pictures/Wallpaper/$wallpaper"
    done
}

lockScreen(){
    swl=$(pgrep swaylock)

    hyprctl dispatch dpms on

    if [ -z "$swl" ]; then 
        hyprctl dispatch dpms off
        swaylock & disown
    fi

}

resetMonitor(){
    killall waybar
    killall hyprpaper
    waybar &
    hyprpaper &
    monitors=$(hyprctl monitors -j | jq -r '.[] | @text "\(.name)|\(.serial)|\(.width)x\(.height)"')

    for m in $monitors;
    do
        name=$(echo $m | awk -F '|' '{print $1}')
        serial=$(echo $m | awk -F '|' '{print $2}')
        resolution=$(echo $m | awk -F '|' '{print $3}')

        if [ "$name" == "eDP-1" ]; then 
            echo "$name,$resolution,1920x0,1"
        else
            pos=$(cat ~/.monitor | grep $serial | awk '{ print $2 }')
            transform=$(cat ~/.monitor | grep $serial | awk '{ print $3 }')
            if [ -z "$transform" ]; then 
                transform="0"
            fi
            hyprctl keywords monitor "$name,$resolution,$pos,1,transform,$transform"
        fi
    done
}

switchToMonitor(){
    monitors=$(hyprctl monitors -j | jq -r 'sort_by(.x) | .[].name ')
    x=0
    for m in ${monitors[@]}; do
        x=$(($x + 1))
        if [ "$1" == "$x" ]; then 
            hyprctl dispatch movecurrentworkspacetomonitor $m
        fi
    done
    
}

switchMonitorType(){
    hdmi=$(hyprctl monitors all -j | jq -r '.[] | select(.name=="HDMI-A-1") | @text "\(.name),preferred,auto,1"')
    hdmiStatus=$(hyprctl monitors all -j | jq -r '.[] | select(.name=="HDMI-A-1") | .x')

    echo $hdmi
    echo $hdmiStatus

    if [ "$hdmiStatus" == "0" ]; then 
        hyprctl keyword monitor "$hdmi"
        notify-send "Screen Mirroring Off"
    else
        hyprctl keyword monitor "$hdmi,mirror,eDP-1"
        notify-send "Screen Mirroring On"
    fi
    randomWallpaper
}


while [ -n "$1" ]; do
    case "${1}" in

        --lid | -l)
            if [ "$2" == "on" ]; then 
                hyprctl dispatch dpms on;
            else
                hyprctl dispatch dpms off;
            fi
            ;;
        -b)
            brighness down
            ;;
        -B)
            brighness up
            ;;
        -w)
            randomWallpaper
            ;;
        -lock)
            lockScreen
            ;;

        --reset | -r)
            resetMonitor
            randomWallpaper
            ;;

        --switchto | -s )
            switchToMonitor $2
            ;;

        --mirror | -m)
            switchMonitorType
            ;;

        --help | -h)
            help
            ;;

    esac
    shift
done

