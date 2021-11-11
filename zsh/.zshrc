
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

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# NVM nodejs switcher
export NVM_DIR="$HOME/.nvm" # nvm 
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
if [ -e /home/nurohman/.nix-profile/etc/profile.d/nix.sh ]; then . /home/nurohman/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
