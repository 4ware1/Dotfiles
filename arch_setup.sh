#!/usr/bin/bash

# Colors
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# Global variables
dir=$(pwd)
fdir="$HOME/.local/share/fonts"
user=$(whoami)

function banner() {
    echo -e "${blueColour}"
    echo -e "    █████╗ ██████╗  ██████╗██╗  ██╗"
    echo -e "   ██╔══██╗██╔══██╗██╔════╝██║  ██║"
    echo -e "   ███████║██████╔╝██║     ███████║"
    echo -e "   ██╔══██║██╔══██╗██║     ██╔══██║"
    echo -e "   ██║  ██║██║  ██║╚██████╗██║  ██║"
    echo -e "   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝"
    echo -e "    ███████╗███████╗████████╗██╗   ██╗██████╗ "
    echo -e "    ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗"
    echo -e "    ███████╗█████╗     ██║   ██║   ██║██████╔╝"
    echo -e "    ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝ "
    echo -e "    ███████║███████╗   ██║   ╚██████╔╝██║     "
    echo -e "    ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝     "
    echo -e "${endColour}"
}

trap ctrl_c INT

function ctrl_c(){
    echo -e "\n\n${redColour}[!] Exiting...\n${endColour}"
    exit 1
}

function ask_yes_no() {
    while true; do
        echo -en "${yellowColour}[?] Do you want to install $1? ([y]/n) ${endColour}"
        read -r response
        response=${response:-"y"}
        if [[ $response =~ ^[Yy]$ ]]; then
            return 0
        elif [[ $response =~ ^[Nn]$ ]]; then
            return 1
        else
            echo -e "\n${redColour}[!] Invalid response, please try again${endColour}"
        fi
    done
}

function install_yay() {
    echo -e "\n${purpleColour}[*] Installing yay AUR helper...\n${endColour}"
    sudo pacman -S --needed --noconfirm git base-devel
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd $dir
}

function install_basic_packages() {
    echo -e "\n${blueColour}[*] Installing basic packages...\n${endColour}"
    sudo pacman -S --needed --noconfirm \
        kitty \
        rofi \
        feh \
        xclip \
        ranger \
        scrot \
        wmname \
        imagemagick \
        python-pip \
        procps-ng \
        fzf \
        bat \
        zsh \
        pamixer \
        flameshot \
        xorg \
        xorg-xinit \
        firefox \
        thunar \
        neofetch \
        wget \
        curl \
        git

    # AUR packages
    yay -S --needed --noconfirm \
        i3lock-fancy \
        lsd \
        tty-clock
}

function install_wm_packages() {
    echo -e "\n${blueColour}[*] Installing window manager and related packages...\n${endColour}"
    sudo pacman -S --needed --noconfirm \
        bspwm \
        sxhkd \
        polybar \
        picom

    # Create config directories
    mkdir -p ~/.config/{bspwm,sxhkd,polybar,picom}
}

function install_terminal_customization() {
    echo -e "\n${blueColour}[*] Installing terminal customization...\n${endColour}"
    
    # Oh My Zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    
    # Powerlevel10k
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    
    # Install Neovim and NvChad
    sudo pacman -S --needed --noconfirm neovim
    rm -rf ~/.config/nvim
    rm -rf ~/.local/share/nvim
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
}

function setup_dotfiles() {
    echo -e "\n${blueColour}[*] Setting up configuration files...\n${endColour}"
    
    # Create necessary directories
    mkdir -p ~/Wallpapers
    mkdir -p ~/.config
    mkdir -p ~/.local/share/fonts
    
    # Copy configuration files if they exist
    if [ -d "$dir/config" ]; then
        cp -r $dir/config/* ~/.config/
    fi
    
    if [ -d "$dir/fonts" ]; then
        cp -r $dir/fonts/* ~/.local/share/fonts/
    fi
    
    if [ -d "$dir/wallpapers" ]; then
        cp -r $dir/wallpapers/* ~/Wallpapers/
    fi
    
    # Update font cache
    fc-cache -f
}

# Main
if [ "$user" == "root" ]; then
    banner
    echo -e "\n${redColour}[!] Don't run this script as root!\n${endColour}"
    exit 1
fi

banner
sleep 1

# Check if running on Arch Linux
if ! command -v pacman &> /dev/null; then
    echo -e "\n${redColour}[!] This script only works on Arch Linux!\n${endColour}"
    exit 1
fi

# Update system
echo -e "\n${blueColour}[*] Updating system...\n${endColour}"
sudo pacman -Syu --noconfirm

# Install yay
if ! command -v yay &> /dev/null; then
    if ask_yes_no "yay (AUR helper)"; then
        install_yay
    fi
fi

# Installation menu
if ask_yes_no "basic packages"; then
    install_basic_packages
fi

if ask_yes_no "BSPWM and related packages"; then
    install_wm_packages
fi

if ask_yes_no "terminal customization (Oh My Zsh, Powerlevel10k, Neovim)"; then
    install_terminal_customization
fi

if ask_yes_no "configuration files"; then
    setup_dotfiles
fi

echo -e "\n${greenColour}[+] Installation completed!\n${endColour}"

if ask_yes_no "restart the system"; then
    sudo reboot
fi