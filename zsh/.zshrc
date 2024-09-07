# Zinit install 
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Pune Theme
#if [ ! -d "$HOME/.zsh/pure" ]; then 
#    mkdir -p "$HOME/.zsh"
#    git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
#fi
#fpath+=($HOME/.zsh/pure)

# Oh My Posh
if [ ! -f "$HOME/.local/bin/oh-my-posh" ]; then 
	curl -Lo "$HOME/.local/bin/oh-my-posh" https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v21.21.2/posh-linux-amd64
	chmod +x "$HOME/.local/bin/oh-my-posh"
fi
PATH=$PATH:$HOME/.local/bin

eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/theme.yaml)"
#eval "$(oh-my-posh init zsh)"

#autoload -U promptinit; promptinit

if [ -f "$HOME/functions.sh" ]; then 
    . "$HOME/functions.sh"
fi 


#PURE_CMD_MAX_EXEC_TIME=10
#zstyle :prompt:pure:path color green
#zstyle ':prompt:pure:prompt:>' color cyan
#zstyle :prompt:pure:git:stash show yes
#zstyle :prompt:pure:execution_time show yes
#
#prompt pure


# PLugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

zinit snippet OMZL::git.zsh
zinit snippet OMZP::archlinux
zinit snippet OMZP::kubectl


## Some config 

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt no_nomatch


zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


## Binding 
bindkey "^a"   beginning-of-line                    # ctrl-a
bindkey "^F"   backward-char                        # ctrl-b
bindkey "^E"   end-of-line                          # ctrl-e
#bindkey "^D"   delete-char                          # ctrl-d
#bindkey "^K"   kill-line                            # ctrl-k
#bindkey "^L"   down-line-or-search                  # ctrl-n
#bindkey "^P"   up-line-or-search                    # ctrl-p
bindkey "^l" clear-screen # ctrl-l
bindkey '^b' history-search-backward
bindkey '^n' history-search-forward

### FZF

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#d0d0d0,fg+:#d0d0d0,bg:#121212,bg+:#262626
  --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#87ff00
  --color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#87afaf
  --color=border:#262626,label:#aeaeae,query:#d9d9d9
  --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="> "
  --marker=">" --pointer="=>" --separator="─" --scrollbar="+"'

# PATH 

VDB_HOME=$HOME/vdb

# Alias Networking 
alias reconnectwifi='nmcli c d office && nmcli c u office'
alias ls='eza --icons=always'

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
alias bgptools="whois -h bgp.tools"
alias ls="eza --icons=always --color=always"

# Note
alias obt="note.sh new"
alias oby="note.sh new y"
alias obtt="note.sh new t"
alias obm="note.sh move"
alias obo="note.sh open"
alias obl="note.sh list"
alias obtd="note.sh openTodo"

#### Auto Added by software/apps
eval "$(fzf --zsh)"
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/mcli mcli


if [ -e /home/nurohman/.nix-profile/etc/profile.d/nix.sh ]; then . /home/nurohman/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
