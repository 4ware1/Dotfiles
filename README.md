# Dotfiles

This repository contains my personalized configuration files for my development environment and operating system. It includes configurations for:

- 🪟 BSPWM (Window Manager)
- 🎨 Polybar (Status Bar)
- 🐱 Kitty (Terminal)
- 🖼️ Picom (Compositor)
- ⌨️ SXHKD (Keyboard Shortcut Manager)
- 🐚 ZSH (Shell)
- 🎯 Powerlevel10k (ZSH Theme)
- 📝 Neovim (Text Editor)
- 🚀 NvChad (Neovim Configuration)

## 📸 Screenshots

### Desktop
![Desktop](/assets/Rofi-Menu.png)

### Terminal
![Terminal](/assets/terminal.png)

### Neovim
![Neovim](/assets/nvim.png)

## 🚀 Features

- Complete BSPWM window manager configuration
- Customized Polybar with useful widgets
- Kitty terminal with custom theme
- Picom for composition effects
- Custom keyboard shortcuts with SXHKD
- ZSH with Powerlevel10k for an enhanced terminal experience
- Neovim with NvChad for an improved development experience
- Automated installation scripts
- Specialized scripts for CTF (Capture The Flag)
- Custom fonts
- Included wallpapers

## 📋 Prerequisites

- Linux operating system (preferably kali linux) Ubuntu/Debian.
- Git
- ZSH
- BSPWM
- Polybar
- Kitty
- Picom
- SXHKD
- Neovim

## 🛠️ Installation

1. Clone this repository:
```bash
git clone https://github.com/4ware1/dotfiles.git
cd dotfiles
```

2. Give execution permissions to the installation script:
```bash
chmod +x setup.sh
```

3. Run the installation script:
```bash
./setup.sh
```

## 📁 Repository Structure

```
.
├── config/           # Application configurations
│   ├── bspwm/       # BSPWM configuration
│   ├── polybar/     # Polybar configuration
│   ├── kitty/       # Kitty configuration
│   ├── picom/       # Picom configuration
│   ├── sxhkd/       # SXHKD configuration
│   └── nvim/        # Neovim configuration
├── fonts/           # Custom fonts
├── scripts/         # Useful scripts for CTF and automation
├── wallpapers/      # Wallpapers
├── .zshrc          # ZSH configuration
├── .p10k.zsh       # Powerlevel10k configuration
└── setup.sh        # Installation script
```

## 🔧 Customization

You can customize the configurations by editing the corresponding files in the `config/` directory. The main configuration files are:

- `config/bspwm/bspwmrc`: Main BSPWM configuration
- `config/polybar/config`: Polybar configuration
- `config/kitty/kitty.conf`: Kitty configuration
- `config/picom/picom.conf`: Picom configuration
- `config/sxhkd/sxhkdrc`: Keyboard shortcuts
- `config/nvim/`: Neovim configuration with NvChad

## ⌨️ Keybinds

### Basic Operations
- `super + Return`: Open terminal (Kitty)
- `super + d`: Open program launcher (Rofi)
- `super + Escape`: Reload sxhkd configuration

### Window Management
- `super + w`: Close window
- `super + shift + w`: Kill window
- `super + m`: Toggle between tiled and monocle layout
- `super + t`: Set window to tiled
- `super + shift + t`: Set window to pseudo-tiled
- `super + f`: Set window to floating
- `super + s`: Set window to fullscreen

### Window Focus
- `super + {Left,Down,Up,Right}`: Focus window in direction
- `super + shift + {Left,Down,Up,Right}`: Swap window in direction
- `super + {1-9,0}`: Focus desktop number
- `super + shift + {1-9,0}`: Move window to desktop number
- `super + bracket{left,right}`: Focus previous/next desktop
- `super + Tab`: Focus last desktop
- `super + grave`: Focus last node

### Window Resize
- `alt + super + {Left,Down,Up,Right}`: Resize window in direction

### Applications
- `super + shift + f`: Open Firefox
- `super + shift + b`: Open Burpsuite

### System
- `ctrl + alt + l`: Lock screen
- `ctrl + shift + Up`: Increase volume
- `ctrl + shift + Down`: Decrease volume
- `ctrl + shift + m`: Toggle mute
- `Print`: Take full screenshot
- `ctrl + Print`: Open screenshot tool

## 📝 Notes

- This setup is tailored for Debian/Ubuntu systems.
- Make sure to backup your current dotfiles before installation
- The installation script will replace existing configurations.
- NvChad installation will be performed automatically during setup.sh execution
- The scripts in the `scripts/` directory are mainly focused on automating common CTF (Capture The Flag) tasks
