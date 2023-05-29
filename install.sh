#!/bin/bash 
#
export CC=gcc-12 CXX=g++-12

yay -S gcc12 hyprland xdg-desktop-portal-hyprland pipewire wireplumber jq grim slurp wlogout swaylock-effects  waybar-hyprland zsh dunst kitty tmux wl-clipboard fuzzel stow ttf-hack-nerd zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

stow hypr dunst kitty nixos nvim scripts tmux zsh waybar swaylock  



