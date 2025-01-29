#!/bin/bash

# Exit on any error
set -e

echo "Starting AUR package installation script..."

# Check if yay is installed
if ! command -v yay &> /dev/null; then
    echo "yay not found. Installing yay..."
    # Clone yay repo
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi

# Array of packages to install
packages=(
    "signal-desktop-beta"
    "go-xlr-utility"
    "goxlr-utility-ui"
    "git"
    "warp-terminal"
    "yay"
    "libreoffice"
    "github-desktop"
    "visual-studio-code-bin"
    "brave-bin"
    "ghostty-git"
    "ledger-live"
    "nordpass-bin"
    "dropbox"
    "spotify"
    "Python3"
    "python-pip"
    "python-pyautogui"
)

# Install packages
for package in "${packages[@]}"; do
    echo "Installing $package..."
    if ! yay -S --noconfirm "$package"; then
        echo "Error installing $package"
        exit 1
    fi
done

echo "All packages installed successfully!"

