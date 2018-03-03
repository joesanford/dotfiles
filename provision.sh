#!/bin/bash
dotfiles=('.tmux.conf'
	'.vimrc')

brewPackages=('git'
	'coreutils'
	'nvm'
	'tmux'
	'python3'
	'reattach-to-user-namespace'
	'fish'
	'wget'
	'htop'
	'nmap'
	'unrar'
	'tree'
	'jq'
	'fzf'
	'kubectl'
	'erlang')

caskPackages=('google-chrome'
	'slack'
	'iterm2'
	'pycharm'
	'webstorm'
	'spotify'
	'sublime'
	'docker'
	'discord'
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
	'font-hack')

fishPlugins=('edc/bass'
	'nvm'
	'fzf'
	'docker-completion')

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

# Install needed packages with homebrew (macOS only)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
for package in "${brewPackages[@]}"
	do
		brew install $package
	done

# Install needed programs from homebrew-cask
brew tap caskroom/cask
brew tap caskroom/fonts
for package in "${caskPackages[@]}"
	do
		brew cask install $package
	done

# Install oh-my-fish, fisherman, and plugins for fish shell
curl -L https://get.oh-my.fish | fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
for package in "${fishPlugins[@]}"
	do
		fisher $package
	done

omf install chain

# Change default shell
chsh -s /usr/local/bin/fish
