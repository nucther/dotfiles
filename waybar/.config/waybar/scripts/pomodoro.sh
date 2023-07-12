#!/bin/sh 
file="${PWD}/.pomodoro"
pid="${PWD}/.pomodoro.pid"
notif_audio="${HOME}/.config/waybar/scripts/notification.wav"
icon="${HOME}/.config/waybar/scripts/pomodoro.png"
class="working"
total_break=0

if [ "$1" == "disable" ]; then 
    rm "$pid"
    if [ ! -f "$file" ] ; then
        touch "$file"
        notify-send -i "$icon" "Pomodoro" "Started for the first session." &
        mpv $notif_audio &
    else  
        rm "$file"
        notify-send -i "$icon" -u critical "Pomodoro" "Disabled pomodoro system." &
        mpv $notif_audio &
    fi

    exit 0;
fi



if [ -f "$file" ]; then 

    if [ -f "$pid" ]; then 
        if read -r message < "$pid"; then 
            printf '{"text": "%s", "class": "%s", "tooltip": "%s"}' "$message" "$class" "Current session: $(($total_break + 1 ))"
        fi

        exit 0;
    fi

    pomodoro_interval=25

    pomodoro_break=5
    pomodoro_long_break=15


    start_time=$(date +%s)
    next_break=$((start_time + ($pomodoro_interval * 60 )))


    while [ $(date +%s) -lt $next_break ]; do 
        
        remain=$(($next_break - $(date +%s)))
        minutes=$(($remain / 60 )) 
        second=$(($remain - ($minutes * 60)))


        printf '{"text":"%02d:%02d","class":"%s", "tooltip": "%s"}\n' "$minutes" "$second" "$class" "Current session: $(($total_break + 1 ))"
        
        echo $(printf "%02d : %02d" "$minutes" "$second") > $pid

        if [ ! -f "$file" ]; then 
            break;
        fi

        if [ "$(date +%s)" == "$(($next_break - 1))" ]; then 
            if [ "$class" == "break" ]; then 
                kill -9 $(hyprctl clients -j | jq '.[] | select(.title=="pomodoro") | select(.class=="kitty") | .pid')
                class="working"
                next_break=$(($(date +%s) + ($pomodoro_interval * 60 )))
                notify-send -i $icon "Pomodoro" "Started session number $(($total_break + 1))" &
            else 
                class="break"
                total_break=$(($total_break + 1))
                next_break=$(($(date +%s) + ($pomodoro_break * 60 )))
                if [ $total_break -lg 5 ]; then 
                    notify-send -i $icon -u critical "Pomodoro" "Break before session $(($total_break + 1))" &
                fi

                if [ -z $(hyprctl clients -j | jq '.[] | select(.title=="pomodoro") | select(.class=="kitty") | .pid') ]; then 
                    kitty -T "pomodoro" --start-as=fullscreen sh -c "$HOME/.config/waybar/scripts/countdown.sh" &
                fi
            fi
            mpv $notif_audio &

            if [ "$total_break" == "5" ]; then 
                total_break=0
                notify-send -i $icon -u critial "Pomodoro" "Long Break session"
                next_break=$(($(date +%s) + ($pomodoro_long_break * 60 )))
            fi

        fi

        sleep 1
    done 
else  
    printf '{"text":"%s","class":"%s"}' "Pomodoro" ""
fi
