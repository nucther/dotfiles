#!/bin/bash
#

. $HOME/.nvm/nvm.sh
total=0

checkUpdate() {
    total=$(yay -Qu | wc -l)

    cnode=$(nvm ls | grep default | head -1 | awk '{ print $5 }'| sed -r "s/[\)|\s]//g" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g")
    [ -z "$cnode" ] && cnode=$(nvm ls | grep default | head 0 | awk '{ print $3 }'| sed -r "s/[\)|\s]//g" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g")
    lnode=$(nvm ls-remote | tail -n 1 | awk '{print $2}' | sed -r "s/[\)|\s]//g" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g")


    if [ "$cnode" != "$lnode" ]; then
        total=$(($total + 1))
    fi


    if [ "$total" -gt 0 ]; then 
        class="warning"
    else 
        class="normal"
    fi

    printf '{"text": "%s", "class": "%s"}' "$total" "$class"
}

update(){
    
    echo "========= System Update ==========="
    
    arch=$(yay -Qu | wc -l)
    
    if [ "$arch" -gt 0 ]; then 
        yay -Syu
    fi

    cnode=$(nvm ls | grep default | head -1 | awk '{ print $5 }'| sed -r "s/[\)|\s]//g" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g")
    [ -z "$cnode" ] && cnode=$(nvm ls | grep default | head 0 | awk '{ print $3 }'| sed -r "s/[\)|\s]//g" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g")
    lnode=$(nvm ls-remote | tail -n 1 | awk '{print $2}' | sed -r "s/[\)|\s]//g" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g")
   
    if [ "$cnode" != "$lnode" ]; then 
        nvm install $lnode 
        nvm use node 
        nvm alias default node 
    fi

    lsnode=$(nvm ls | awk '{print $2}' | grep v | sed -r "s/[\)|\s]//g" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g")



    if [ "$(echo "$lsnode" | wc -l)" -gt 1 ]; then 
        
        read -p "Do you want remote old version nodejs? [y/N]" delnode
        delnode=${delnode:-N}

        if [ "$delnode" == "Y" ] || [ "$delnode" == "y" ]; then 
            lsn=$(echo "$lsnode" | fzf -m )

            for n in ${lsn[@]}; do 
                nvm uninstall $n
            done
        fi

    else 
        echo "none"
    fi
    
}


$1
