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
    while ps | grep $1 &> /dev/null ; do 
        echo -n "."
        sleep 2
    done
    echo -en "done!\n"
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
    xdg-desktop-portal-hyprland
    pipewire 
    wireplumber
    grim 
    slurp
    wlogout
    swaylock-effects
    waybar-hyprland
    wl-clipboard
    sddm-git
)

software=(
    kitty
    dunst
    zsh
    jq
    tmux
    stow
    fuzzel
    openssh
    fzf
    nvim-packer-git
    unzip 
    pavucontrol
    btop 
    pulseaudio
    nemo
    mpv
    imv
    authy
    lazygit
    udiskie
    whois
    podman
    kind
    dnsutils
    mtr
    mupdf-gl
    mupdf-tools
)

fonts=(
    ttf-hack-nerd 
    noto-fonts 
    noto-fonts-variable-ar 
    noto-fonts-sc-vf
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

# Install Oh ZSH 
if [ -d "~/.oh-my-zsh" ]; then 
    echo -e "Install OH-MY-ZSH"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo -e "$OK OH-MY-ZSH already installed"
fi

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
    source ~/.nvm/nvm.sh

    nodeLatest=$(nvm ls-remote | tail -n 1 | awk '{ print $2 }')
    currNode=$(nvm ls | grep default | head -1 | awk '{ print $3 }')

#    echo $nodeLatest
#    echo $currNode
#    if [ "$nodeLatest" = "$currNode" ]; then 
#        echo -e "$OK Already latest nodejs"
#    else  
#        nvm install $nodeLatest &>> $LOOG &
#        progress $!
#        nodeNow=$(nvm ls | grep default | head -1 | awk '{ print $3 }') 
#
#        if [ "$nodeNow" = "$nodeLatest" ]; then 
#            echo -e "$OK nodejs version $nodeLatest installed"
#        else 
#            echo -e "$ER failed to install nodejs please check $LOOG"
#        fi
#    fi
fi


echo -e "$OK update directory"
stow hypr dunst kitty nixos nvim scripts tmux zsh waybar swaylock 

