function venv() {
    evs=$(/usr/bin/ls $HOME/venv | fzf)

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
    wt=$(/usr/bin/ls $HOME/.nixos | fzf)
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
    if test -z "$1"; then 
	node=$(incus remote ls -f json | jq -r 'to_entries[] | select(.value.Protocol == "incus") | .key' | fzf )
	echo $node
	list_vm=$(incus ls $node: --all-projects -f json | jq -r '.[] | select(.status =="Running") | "\(.name):\(.project)"' | fzf)
	cstatus=$(incus ls $node: --all-projects -f json | jq -r '.[] | select(.name=="'"$list_vm"'") | .status')
	echo -e "==========\n\e[31mYou are now\nConnecting to VM \e[32m$list_vm\e[0m\n==========\e\n\n"
	project=$(echo $list_vm | awk -F ':' '{print $2}')
	vm=$(echo $list_vm | awk -F ':' '{print $1}')
	incus exec --project $project $node:$vm bash
    else
	incus exec $1 bash
    fi
}

function create_ct(){
    if [ -z "$3" ]; then 
	    profile="default"
    else 
	    profile="$3"
    fi
    incus launch "images:$1" --profile $profile $2 
}

function create_vm(){
    incus launch "images:$1" $2 --vm
}
