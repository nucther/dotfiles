function venv() {
    evs=$(ls $HOME/venv | fzf)

    source "$HOME/venv/$evs/bin/activate"
    tmux setenv VIRTUAL_ENV "$HOME/venv/$evs"
}

function venv-clear() {
    tmux setenv -r VIRTUAL_ENV
}

function switchlang() {
    wt=$(ls $HOME/.nixos | fzf)

    if [ -n "$wt" ]; then 
        nix-shell $HOME/.nixos/$wt --run "zsh"
    fi
}


### Installation 
function install_plex(){
    docker run -d --name plex --network=host -e TZ="Asia/Jakarta" -e PLEX_CLAIM="" -v /home/plex/config:/config -v /home/plex/temp:/transcode -v /home/movies/complete:/data plexinc/pms-docker
}
