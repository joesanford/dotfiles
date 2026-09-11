# dotfiles
Configurations for `zsh`, `tmux`, `vim`, and `kitty`, plus a default `eslint` file and a provisioning script for Arch/CachyOS machines.

<<<<<<< Updated upstream
To provision a new Mac (symlinks dotfiles, installs Homebrew packages/casks), run `bash provision.sh`.

To provision a headless Linux box (symlinks `.bashrc`, `.tmux.conf`, `.vimrc` only, no package installs), run `bash provision-server.sh`.
=======
To provision a new machine, run `bash provision.sh`. It symlinks the dotfiles into `$HOME` and installs base CLI tools and GUI apps via `pacman`/`paru`.
>>>>>>> Stashed changes
