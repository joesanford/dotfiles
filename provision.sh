#!/bin/bash
dotfiles=(
	'.zshrc'
	'.tmux.conf'
	'.vimrc'
)

brew_packages=(
	'nvm'
	'tmux'
	'reattach-to-user-namespace'
	'wget'
	'htop'
	'nmap'
	'unrar'
	'tree'
	'jq'
)

cask_apps=(
	'google-chrome'
	'iterm2'
	'spotify'
	'sublime-text'
	'docker'
	'discord'
	'postman'
	'istat-menus'
	'1password'
	'ngrok'
	'svn'
	'karabiner-elements'
	'bartender'
	'sizeup'
	'visual-studio-code'
	'prusaslicer'
	'vlc'
	'steam'
	'font-inconsolata-g-for-powerline'
)

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Symlink all dotfiles (-f makes this safe to rerun)
for dotfile in "${dotfiles[@]}"
    do
        ln -sf "$dir/$dotfile" ~/
    done

# Install Homebrew if missing
if ! command -v brew &>/dev/null; then
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew update
for package in "${brew_packages[@]}"
	do
		brew install $package
	done

# Install applications with homebrew cask
for app in "${cask_apps[@]}"
	do
		brew install --cask $app
	done
