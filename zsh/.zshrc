
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git kubectl tmux)

source $ZSH/oh-my-zsh.sh

PATH=$PATH:$HOME/.local/bin

export KUBECONFIG=$HOME/.kube/config

if [ -n "$VIRTUAL_ENV" ]; then 
    . "$VIRTUAL_ENV/bin/activate"
fi

if [ -f "$HOME/functions.sh" ]; then 
    . "$HOME/functions.sh"
fi 

#if [ -n "$nixlang" ]; then 
#    nix-shell $HOME/.nixos/$nixlang --run "zsh" 
#fi

#Kubernetes alias
alias kgn="kubectl get nodes"
alias kgc="kubectl config view"
alias kcc="kubectl config current-context"

#Kubernetes addons Krew 
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Zerotier
alias zcli="sudo zerotier-cli"
alias zln="sudo zerotier-cli listnetworks"
alias zp="sudo zerotier-cli peers"
alias zpl="sudo zerotier-cli peers | grep LEAF"
alias zpo="sudo zerotier-cli peers | grep ORBIT"
alias zpp="sudo zerotier-cli peers | grep PLANET"
alias zlp="sudo zerotier-cli listpeers"
alias zi="sudo zerotier-cli info"

# Whois 
alias arin="whois  -h whois.arin.net"
alias arinrr="whois  -h rr.arin.net"
alias apnic="whois  -h whois.apnic.net"
alias afrinic="whois -h whois.afrinic.net"
alias ripe="whois  -h whois.ripe.net"
alias lacnic="whois  -h whois.lacnic.net"
alias altdb="whois  -h whois.altdb.net"
alias radb="whois  -h whois.radb.net"
alias level3="whois  -h rr.level3.net"
alias bell="whois  -h whois.in.bell.ca"
alias ntt="whois  -h rr.ntt.net"
alias idnic="whois -h irr.idnic.net"
# PS

defaultps="%{$fg[cyan]%}%c%{$reset_color%}" 
PS="\$(setPS)"
setPS
#PS1="\$(setPS)"

# NVM nodejs switcher
export NVM_DIR="$HOME/.nvm" # nvm 
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
if [ -e /home/nurohman/.nix-profile/etc/profile.d/nix.sh ]; then . /home/nurohman/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
