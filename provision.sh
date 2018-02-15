#!/bin/bash
dotfiles=('.tmux.conf'
	'.zshrc'
	'.vimrc')

brewPackages=('git'
	'coreutils'
	'nvm'
	'tmux'
	'python3'
	'reattach-to-user-namespace'
	'zsh'
	'wget'
	'htop'
	'nmap'
	'unrar'
	'tree'
	'jq')

caskPackages=('firefox'
	'slack'
	'iterm2'
	'pycharm'
	'webstorm'
	'spotify'
	'sublime'
	'docker'
	'discord'
	'flux'
	'postman'
	'istat-menus'
	'1password'
	'ngrok'
	'karabiner-elements'
	'bartender'
	'psequel'
	'sequel-pro'
	'sizeup'
	'font-inconsolata'
	'font-inconsolata-nerd-font-mono')

# Symlink all dotfiles
for dotfile in "${dotfiles[@]}" 
    do
        ln -s $dotfile ~/
    done

# Install needed packages with homebrew (macOS only)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
for package in "${brewPackages[@]}"
	do
		brew install $package
	done

# Install needed programs from homebrew-cask
brew tap caskroom/cask
for package in "${caskPackages[@]}"
	do
		brew cask install $package
	done
