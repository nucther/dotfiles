#!/bin/bash

cpus=$(cat /proc/cpuinfo | grep -c processor)

updateSink(){
    sinkm=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
    vol=$(pactl get-sink-volume @DEFAULT_SINK@ | head -n 1| awk -F '/' '{gsub(" ","",$0); gsub("%",""); print $2}')

    eww update sinkvol=$vol

    if [ "$sinkm" == "no" ]; then 
        eww update sinkmute=false
    else
        eww update sinkmute=true
    fi

}

updateSource(){
    sourcem=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')
    vol=$(pactl get-source-volume @DEFAULT_SOURCE@ | head -n 1| awk -F '/' '{gsub(" ","",$0); gsub("%",""); print $2}')

    eww update sourcevol=$vol

    if [ "$sourcem" == "no" ]; then 
        eww update sourcemute=false
    else 
        eww update sourcemute=true
    fi

}

audioChange(){
    updateSink
    updateSource
    
    pactl subscribe | while read x event y type num; do
        echo "$type"
        if [ "$type" == "source" ]; then 
            updateSource
        fi

        if [ "$type" == "sink" ]; then 
            updateSink
        fi
    done
}

getSSID(){
    ssid=$(nmcli c s --active | grep wifi | awk '{print $1}' | xargs nmcli c s  | grep ssid | head -n 1 | awk '{print $2}')

    echo $ssid
}

while [ -n "$1" ]; do
    case "${1}"  in
        am)
            audioChange
            ;;
        ssid)
            getSSID
            ;;
        volumeup)
            pactl set-sink-volume @DEFAULT_SINK@ +1%
            ;;
        volumedown)
            pactl set-sink-volume @DEFAULT_SINK@ -1%
            ;;
        micup)
            pactl set-source-volume @DEFAULT_SOURCE@ +1%
            ;;
        micdown)
            pactl set-source-volume @DEFAULT_SOURCE@ -1%
            ;;

    esac
    shift
done
