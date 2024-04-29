#!/bin/bash
if [ -z "$2" ]; then
    country="id"
else 
    country=$2
fi

cl=$(curl -s https://public-dns.info/nameserver/$country.json | jq -r '.[].ip')

declare -a list=$cl

success=0
failed=0
echo -e "\n\n====================================\n\nTest DNS for $1\nFrom: $country\n\n====================================\n\n"
for i in $list; do
    if [ -z "$2" ]; then 
        query="A"
    else
        query=$2
    fi
    dr=$(dig +short @$i $query $1)

    response=$(printf "%15s %15s" $i $dr)
    echo -en "$response\r"
    if [ ! -z "$dr" ]; then
        success=$(($success + 1))
    else 
        failed=$(($failed + 1))
    fi
done

echo -e "\n\nSuccess: $success\nFailed: $failed"
