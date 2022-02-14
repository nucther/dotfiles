function venv() {
    evs=$(ls $HOME/venv | fzf)

    source "$HOME/venv/$evs/bin/activate"
    tmux setenv VIRTUAL_ENV "$HOME/venv/$evs"
    setPS
}

function venv-clear() {
    unset VIRTUAL_ENV
    tmux setenv -r VIRTUAL_ENV
    setPS
}

function language() {
    wt=$(ls $HOME/.nixos | fzf)

    if [ -n "$wt" ]; then 
        nix-shell $HOME/.nixos/$wt --run "zsh"
    fi
    setPS
}


#Zerotier 
function zc(){
    network=$(cat $HOME/.zerotier-network | fzf | awk '{print $1}')
    sudo zerotier-cli join $network
}

function zd(){
    network=$(sudo zerotier-cli listnetworks | grep -n 1 | awk '{print $3" "$4}'| fzf | awk '{print $1}')
    sudo zerotier-cli leave $network
}
### Installation 
function install_plex(){
    docker run -d --name plex --network=host -e TZ="Asia/Jakarta" -e PLEX_CLAIM="" -v /home/plex/config:/config -v /home/plex/temp:/transcode -v /home/movies/complete:/data plexinc/pms-docker
}

function setPS(){
    newps="$fg[green] $defaultps"

    if [ -n "$VIRTUAL_ENV" ]; then 
        vEnv=$(basename $VIRTUAL_ENV)
        newps="$fg[blue] [$vEnv] $reset_color $fg[cyan] $reset_color $defaultps"
    fi

    if [ -n "$nixlang" ]; then 
        newps="$fg[yellow] [$nixlang] $reset_color $fg[green] $reset_color $defaultps"
    fi

    #echo "$newps "
    PS1="$newps \$(git_prompt_info)"
}

#VPN
function vpn-connect-sinta(){
    sudo ip r add default via 10.242.0.253
}

function vpn-disconenct-sinta(){
    sudo ip r del default via 10.242.0.253
}

function zerotier-join-consap(){
    sudo zerotier-cli join e4da7455b2a57d4e
}

function zertier-leave-consap(){
    sudo zerotier-cli leave e4da7455b2a57d4e
}



## NixOs Functions 
function killdocker() {
    did=$(sudo pgrep dockerd)
    sudo kill -9 $did
    exit
}
## Monitor
function setMonitor(){
    xrandr --newmode "1600x900" 118.25  1600 1696 1856 2112  900 903 908 934
    xrandr --addmode DP1 "1600x900"
}
