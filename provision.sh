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

# KDE Plasma settings (look/theme, panels, shortcuts). Source lives under
# kde/<name>, but each targets $HOME/.config/<name> directly (not nested).
kde_dotfiles=(
	'kdeglobals'
	'plasma-org.kde.plasma.desktop-appletsrc'
	'kwinrc'
	'plasmarc'
	'plasmashellrc'
	'plasmaparc'
	'plasmanotifyrc'
	'kglobalshortcutsrc'
	'dolphinrc'
	'kscreenlockerrc'
	'ksmserverrc'
	'plasma-localerc'
)

# Extend config_dotfiles for yay, which lives in its own subdir like kitty.
config_dotfiles+=('yay/config.json')

# Files that live under ~/.local/share/<path>.
local_share_dotfiles=(
	'user-places.xbel'
)

# GTK/Qt look-and-feel and misc app settings that don't have a natural
# subdir of their own. Source lives under misc/<name>, targets
# $HOME/.config/<name> directly.
misc_dotfiles=(
	'gtkrc'
	'gtkrc-2.0'
	'QtProject.conf'
	'mimeapps.list'
)

# Whole directories under ~/.config/<name>, symlinked as a unit rather than
# file-by-file (e.g. GTK theme CSS + its asset SVGs).
config_dir_dotfiles=(
	'gtk-3.0'
	'gtk-4.0'
	'xsettingsd'
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

for kde_dotfile in "${kde_dotfiles[@]}"; do
	target="$HOME/.config/$kde_dotfile"
	if [ -L "$target" ]; then
		rm "$target"
	elif [ -e "$target" ]; then
		mv "$target" "$target.bak"
		echo "Backed up existing $target to $target.bak"
	fi
	ln -s "$dir/kde/$kde_dotfile" "$target"
done

for local_share_dotfile in "${local_share_dotfiles[@]}"; do
	target="$HOME/.local/share/$local_share_dotfile"
	mkdir -p "$(dirname "$target")"
	if [ -L "$target" ]; then
		rm "$target"
	elif [ -e "$target" ]; then
		mv "$target" "$target.bak"
		echo "Backed up existing $target to $target.bak"
	fi
	ln -s "$dir/local-share/$local_share_dotfile" "$target"
done

for misc_dotfile in "${misc_dotfiles[@]}"; do
	target="$HOME/.config/$misc_dotfile"
	if [ -L "$target" ]; then
		rm "$target"
	elif [ -e "$target" ]; then
		mv "$target" "$target.bak"
		echo "Backed up existing $target to $target.bak"
	fi
	ln -s "$dir/misc/$misc_dotfile" "$target"
done

for config_dir_dotfile in "${config_dir_dotfiles[@]}"; do
	target="$HOME/.config/$config_dir_dotfile"
	if [ -L "$target" ]; then
		rm "$target"
	elif [ -e "$target" ]; then
		mv "$target" "$target.bak"
		echo "Backed up existing $target to $target.bak"
	fi
	ln -s "$dir/$config_dir_dotfile" "$target"
done

# Install base + GUI packages from official repos
sudo pacman -Syu --needed --noconfirm "${pacman_packages[@]}" "${pacman_gui_packages[@]}"

# Let the current user run docker without sudo
sudo usermod -aG docker "$USER"
