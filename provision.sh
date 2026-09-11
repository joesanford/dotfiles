#!/bin/bash
set -euo pipefail

dotfiles=(
	'.zshrc'
	'.tmux.conf'
	'.vimrc'
)

# Files that live under ~/.config/<path> instead of directly in $HOME.
config_dotfiles=(
	'kitty/kitty.conf'
	'kitty/colors.conf'
	'kitty/hyde.conf'
	'kitty/theme.conf'
	'kitty/current-theme.conf'
)

# Base CLI tools - always want these on any machine
pacman_packages=(
	'git'
	'zsh'
	'tmux'
	'vim'
	'wget'
	'curl'
	'htop'
	'btop'
	'nmap'
	'unrar'
	'zip'
	'unzip'
	'tree'
	'jq'
	'fzf'
	'ripgrep'
	'fd'
	'bat'
	'eza'
	'zoxide'
	'rsync'
	'openssh'
	'whois'
	'tcpdump'
	'ngrep'
	'subversion'
	'nvm'
	'ttf-jetbrains-mono-nerd'
)

# GUI apps available in the official repos
pacman_gui_packages=(
	'kitty'
	'discord'
	'vlc'
	'steam'
	'docker'
	'docker-compose'
	'prusa-slicer'
)

dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Symlink dotfiles, backing up anything real that's already there
for dotfile in "${dotfiles[@]}"; do
	target="$HOME/$dotfile"
	if [ -L "$target" ]; then
		rm "$target"
	elif [ -e "$target" ]; then
		mv "$target" "$target.bak"
		echo "Backed up existing $target to $target.bak"
	fi
	ln -s "$dir/$dotfile" "$target"
done

for config_dotfile in "${config_dotfiles[@]}"; do
	target="$HOME/.config/$config_dotfile"
	mkdir -p "$(dirname "$target")"
	if [ -L "$target" ]; then
		rm "$target"
	elif [ -e "$target" ]; then
		mv "$target" "$target.bak"
		echo "Backed up existing $target to $target.bak"
	fi
	ln -s "$dir/$config_dotfile" "$target"
done

# Install base + GUI packages from official repos
sudo pacman -Syu --needed --noconfirm "${pacman_packages[@]}" "${pacman_gui_packages[@]}"

# Let the current user run docker without sudo
sudo usermod -aG docker "$USER"
