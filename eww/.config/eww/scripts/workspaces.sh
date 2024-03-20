#!/bin/bash

monitor=$1

workspaces=$(hyprctl workspaces -j | jq --argjson MID "$monitor" '. | map(select(.monitorID == $MID)) | .[].name')

for i in $workspaces; 
do
    echo $i
done
