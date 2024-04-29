#!/bin/bash

listWorkspaces(){
    monitor=$1

    #workspaces=$(hyprctl workspaces -j | jq -r --argjson MID "$monitor" '. | map(select(.monitorID == $MID)) | .[].name')
    workspaces=$(hyprctl workspaces -j | jq -r 'sort | .[].name')
    activeworkspace=$(hyprctl activeworkspace -j | jq -r '.id')

    result="(box :class 'workspaces' "

    for i in $workspaces; 
    do
        if [ "$i" == "$activeworkspace" ]; then
            result+="(button :class 'active' :onclick 'hyprctl dispatch workspace $i' \"$i\")"
        else
            result+="(button :onclick 'hyprctl dispatch workspace $i' \"$i\")"
        fi
    done
    
    result+=")"
    echo $result
}

socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | while read -r; do 
   listWorkspaces $1
done
