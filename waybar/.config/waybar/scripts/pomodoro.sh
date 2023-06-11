#!/bin/sh 

file="${PWD}/.pomodoro"
notif_audio="${HOME}/.config/waybar/scripts/notification.wav"

if [ "$1" == "disable" ]; then 
    if [ ! -f "$file" ] ; then
        touch "$file"
        notify-send "Pomodoro" "Started for the first session."
        mpv $notif_audio &
    else  
        rm "$file"
        notify-send -u critical "Pomodoro" "Disabled pomodoro system."
        mpv $notif_audio &
    fi

    exit 0;
fi

if [ -f "$file" ]; then 

    pomodoro_interval=25

    pomodoro_break=5
    pomodoro_long_break=15

    total_break=0

    start_time=$(date +%s)
    next_break=$((start_time + ($pomodoro_interval * 60 )))
    class="working"


    while [ $(date +%s) -lt $next_break ]; do 
        
        remain=$(($next_break - $(date +%s)))
        minutes=$(($remain / 60 )) 
        second=$(($remain - ($minutes * 60)))


        printf '{"text":"%02d:%02d","class":"%s"}\n' "$minutes" "$second" "$class"

        if [ ! -f "$file" ]; then 
            break;
        fi

        if [ "$(date +%s)" == "$(($next_break - 1))" ]; then 
            if [ "$class" == "break" ]; then 
                class="working"
                next_break=$(($(date +%s) + ($pomodoro_interval * 60 )))
                notify-send "Pomodoro" "Started session number $(($total_break + 1))"
            else 
                class="break"
                total_break=$(($total_break + 1))
                next_break=$(($(date +%s) + ($pomodoro_break * 60 )))
                if [ $total_break -lg 5 ]; then 
                    notify-send -u critical "Pomodoro" "Break before session $(($total_break + 1))"
                fi
            fi
            mpv $notif_audio &

            if [ "$total_break" == "5" ]; then 
                total_break=0
                notify-send -u critial "Pomodoro" "Long Break session"
                next_break=$(($(date +%s) + ($pomodoro_long_break * 60 )))
            fi

        fi

        sleep 1
    done 
else  
    printf '{"text":"%s","class":"%s"}' "Pomodoro" ""
fi
