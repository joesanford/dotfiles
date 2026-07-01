#!/bin/bash
# Minimal provisioning for headless boxes (e.g. Unraid hosts with an
# ephemeral root filesystem, rebuilt from the boot flash every reboot).
# Just symlinks dotfiles, no package installs, no Homebrew/casks -- those
# are a macOS-workstation concern, see provision.sh.

dotfiles=(
	'.bash_profile'
	'.tmux.conf'
	'.vimrc'
)

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for dotfile in "${dotfiles[@]}"
	do
		ln -sf "$dir/$dotfile" ~/
	done
