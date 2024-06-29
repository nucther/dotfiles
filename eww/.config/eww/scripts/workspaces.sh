#!/bin/bash

listWorkspaces(){
    monitor=$1

    #workspaces=$(hyprctl workspaces -j | jq -r --argjson MID "$monitor" '. | map(select(.monitorID == $MID)) | .[].name')
    workspaces=$(hyprctl workspaces -j | jq -r 'sort | .[].name')
    activeworkspace=$(hyprctl activeworkspace -j | jq -r '.id')

    result="(box :class 'workspaces' :space-evenly false"

    for i in $workspaces; 
    do
		if [ "$i" == "special:special" ]; then 
			name="󱀅"
		else
			name="$i"
		fi

        if [ "$i" == "$activeworkspace" ]; then
            result+="(button :class 'active' :onclick 'hyprctl dispatch workspace $i' \"$name\")"
        else
            result+="(button :onclick 'hyprctl dispatch workspace $i' \"$name\")"
        fi
    done
    
    result+=")"
    echo $result
}

socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r; do 
   listWorkspaces $1
done
