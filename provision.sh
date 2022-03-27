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

dir=$(pwd)

# Symlink all dotfiles
for dotfile in "${dotfiles[@]}" 
    do
        ln -s $dir$dotfile ~/
    done

# fish shell pre-populates these files
rm ~/.config/fish/config.fish
rm ~/.config/fish/aliases.fish
ln -s ${dir}/config.fish /Users/joe/.config/fish/
ln -s ${dir}/aliases.fish /Users/joe/.config/fish/

# Install packages with homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/cask-fonts
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
