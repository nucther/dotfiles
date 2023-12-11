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
    title=$(echo $wt | sed 's/.nix//')
    if [ -n "$wt" ]; then
        tmux rename-window "$title"
        nix-shell $HOME/.nixos/$wt --run "zsh"
    fi    
    setPS
    tmux rename-window "zsh"
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

# Other function 

function reconnectOfficeWifi(){
    nmcli c d office && nmcli c u office
}


# Incus 

function connect_to(){
    list_vm=$(incus ls -f json | jq -r '.[].name' | fzf)
    echo -e "==========\n\e[31mYou are now\nConnecting to VM \e[32m$list_vm\e[0m\n==========\e\n\n"
    incus exec $list_vm bash
}

function create_ct(){
    incus launch "images:$1" $2
}

function create_vm(){
    incus launch "images:$1" $2 --vm
}
