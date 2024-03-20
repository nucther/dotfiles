#!/bin/bash

cl=$(curl -s https://public-dns.info/nameserver/id.json | jq -r '.[].ip')

declare -a list=$cl

for i in $list; do
    if [ -z "$2" ]; then 
        query="A"
    else
        query=$2
    fi
    dr=$(dig +short @$i $query $1)

    response="$i => $dr"
    echo $response
done
