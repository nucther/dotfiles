#!/bin/bash 
#
export CC=gcc-12 CXX=g++-12

# set some colors
NT="[\e[1;36mNOTE\e[0m]"
OK="[\e[1;32mOK\e[0m]"
ER="[\e[1;31mERROR\e[0m]"
AT="[\e[1;37mATTENTION\e[0m]"
WR="[\e[1;35mWARNING\e[0m]"
AC="[\e[1;33mACTION\e[0m]"
LOOG="/tmp/install.log"

progress() {
    echo -en "$AC Progress: "
    while ps | grep $1 &> /dev/null ; do 
        echo -n "."
        sleep 2
    done
    echo -en " => done!\n"
    sleep 2 
}

install() {
    if yay -Q $1 &>>/dev/null ; then 
        echo -e "$OK $1 already installed"
    else 
        echo -e "Starting to Install $1"
        yay -S --noconfirm $1 &>> $LOOG &
        progress $!

        if yay -Q $1 &>>/dev/null ; then 
            echo -e "\e$OK $1 Installed"
        else 
            echo -e "\e$ER $1 failed to install please check $LOOG"
            exit 
        fi
    fi

}

sudo echo "Installation running"

prepare=(
    gcc12  
    python-pip
    usbutils
)

hyprland=(
    hyprland
    hyprpaper # wallpaper 
    hyprlock # Lock
    hypridle # Idle
    xdg-desktop-portal-hyprland
    pipewire 
    wireplumber
    grim 
    slurp
    wl-clipboard
    greetd
    greetd-tuigreet
	qt5-wayland
)

software=(
    fastfetch
    kitty
    dunst
    zsh
    jq
    tmux
    stow
    fuzzel
    openssh
    fzf
	bat # Cat alternate
    nvim-packer-git
	luarocks # Lua dependency
    unzip 
    pavucontrol
    pipewire-pulse #replacce pulse audio
    bottom #alternate to HTOP 
    nemo
    mpv
    imv
    lazygit
    udiskie
    whois
    podman # Containered
    kind # K8s cluster test
    dnsutils
    mtr
    mupdf-gl
    mupdf-tools
    scrcpy # Android mirror 
    ripgrep
    wget
    k9s # K8s client
    vultr-cli # Vultr cli 
    doctl # Digital Ocean cli 
    alsa-utils
    gocloc-git
    p7zip-gui
    incus # Virtualization
	virt-manager # only for spice client
	skopeo # Incus required for container
	umoci # Incus required for container
    lunacy # Design alternate figma 
    bluez # Bluetooth driver
    overskride # Bluetooth manager
    eza #Replacement for ls
	ncdu #du alternatif
	satty-bin # Screenshot editor
	unbound # DNS server
	jellyfin-mpv-shim # Jellyfin Player MPV
	socat # Eww websocket
	btop # Taskmanager
	newsboat # RSS Client
)

fonts=(
    ttf-hack-nerd 
	ttf-maple
    noto-fonts 
    noto-fonts-variable-ar 
    noto-fonts-sc-vf
	noto-fonts-emoji
)

nixdekstop=(
    remmina
)

devops=(
	helm
	vault
	terraform
	ansible
	python-pytz

)

for pre in ${prepare[@]}; do
    install $pre 
done 

for hyp in  ${hyprland[@]}; do 
    install $hyp 
done 

for swr in ${software[@]}; do 
    install $swr 
done

for font in ${fonts[@]}; do 
    install $font 
done 

for devopsi in ${devops}; do 
	install $devopsi
done

#for nix in ${nixdekstop[@]}; do 
#    spath=$(find /nix/store/ | grep $nix | grep "bin/$nix")
#
#    echo $spath
#done

# Install Oh ZSH 
#if [ -d "~/.oh-my-zsh" ]; then 
#    echo -e "Install OH-MY-ZSH"
#    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#else
#    echo -e "$OK OH-MY-ZSH already installed"
#fi
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

if [ -z "$(which nix)" ]; then 
    echo -e "Install NIX"
    sh <(curl -L https://nixos.org/nix/install) --no-daemon
else 
    echo -e "$OK NIX already installed"
fi

if [ -f "~/.nvm/nvm.sh"  ]; then 
    echo -e "Install NVM"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
else
    echo -e "$OK NVM already installed"
    . $HOME/.nvm/nvm.sh
    nvm use node 

    lnode=$(nvm ls-remote | tail -n 1 | awk '{ print $2 }' | sed -r "s/[\)|\s]//g" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g")
    [ -z "$lnode" ] && lnode=$(nvm ls-remote | tail -n 1 | awk '{ print $1 }' | sed -r "s/[\)|\s]//g" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g")

    cnode=$(nvm ls | grep default | head -1 | awk '{ print $5 }'| sed -r "s/[\)|\s]//g" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g")
    [ -z "$cnode" ] && cnode=$(nvm ls | grep default | head 0 | awk '{ print $3 }'| sed -r "s/[\)|\s]//g" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g")

    
    if [ "$lnode" == "$cnode" ]; then
        echo -e "$OK Already latest nodejs"


    else  
        echo -e "$NT Install latest nodejs version $lnode"
        nvm install $lnode &>> $LOOG &
        progress $!

        echo -e "$NT Replace nodejs $cnode to $lnode"
        nvm use node 
        nvm alias default node 

        nodeNow=$(nvm ls | grep default | head -1 | awk '{ print $5 }' | sed -r "s/[\)|\s]//g" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g") 

        if [ "$nodeNow" = "$lnode" ]; then 
            echo -e "$OK nodejs version $lnode installed"
        else 
            echo -e "$ER failed to install nodejs please check $LOOG"
        fi
    fi
fi


echo -e "$OK update directory"
stow -R hypr dunst kitty nixos nvim scripts tmux zsh waybar swaylock eww oh-my-posh pipewire newsboat

## NVIM Usage 
if [ -z "$(pip list | grep neovim)" ]; then 
    echo -e "$AC Install Neovim for Python"
    yay -S python-neovim  --noconfirm
fi

if [ -z $(which neovim-node-host) ]; then 
    echo -e "$AC Install Neovim for Node"
    npm i -g neovim
fi

if [ -z "$(yay -Q | grep ansible)" ]; then 
	echo "install python module required by ansible netbox inventory"
	yay -S python-pytz python-pynetbox --noconfirm
fi
