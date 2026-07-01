#!/bin/bash
# Minimal provisioning for headless boxes (e.g. Unraid hosts with an
# ephemeral root filesystem, rebuilt from the boot flash every reboot).
# Just symlinks dotfiles, no package installs, no Homebrew/casks -- those
# are a macOS-workstation concern, see provision.sh.

dotfiles=(
	'.bashrc'
	'.tmux.conf'
	'.vimrc'
)

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for dotfile in "${dotfiles[@]}"
	do
		ln -sf "$dir/$dotfile" ~/
	done

# SSH login shells read ~/.profile, not ~/.bashrc directly -- make sure it
# gets picked up on login, not just on interactive subshells.
grep -qF '.bashrc' ~/.profile 2>/dev/null || echo '[ -f ~/.bashrc ] && . ~/.bashrc' >> ~/.profile
