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

function lswitch() {
    wt=$(ls $HOME/.nixos | fzf)

    if [ -n "$wt" ]; then 
        nix-shell $HOME/.nixos/$wt --run "zsh"
    fi
    setPS
}

#Kubernetes 
function kswitch(){
    context=$(kubectl config view -o jsonpath="{.contexts[*]}"| jq -r ".name" | fzf)
    kubectl config use-context $context
}

#Zerotier 
function zc(){
    network=$(cat $HOME/.zerotier-network | fzf | awk '{print $1}')
    sudo zerotier-cli join $network
}

function zd(){
    network=$(sudo zerotier-cli -j listnetworks | jq -r '.[] | [.nwid,.name] | @tsv' | fzf | awk -F '\t' '{print $1}')
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

# Other function 

function reconnectOfficeWifi(){
    nmcli c d office && nmcli c u office
}

function connectSinta(){
    sudo ip route add default via 10.242.0.5
}

function disconnectSinta(){
    sudo ip route del default via 10.242.0.5
}
