#!/bin/sh 

file="${PWD}/.pomodoro"

if [ "$1" == "disable" ]; then 
    if [ ! -f "$file" ] ; then
        touch "$file"
    else  
        rm "$file"
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

    notify-send "POMODORO: Start"
    aplay notification.wav&
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
                notify-send "POMODORO: Start"
                total_break++
            else 
                class="break"
                next_break=$(($(date +%s) + ($pomodoro_break * 60 )))
                notify-send "POMODORO: Break"
            fi
            aplay notification.wav &

            if [ "$total_break" == "4" ]; then 
                next_break=$(($(date +%s) + ($pomodoro_long_break * 60 )))
            fi

        fi

        sleep 1
    done 
else  
    printf '{"text":"%s","class":"%s"}' "Pomodoro" ""
fi
