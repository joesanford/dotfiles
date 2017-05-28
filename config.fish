# Bring in aliases
. ~/.config/fish/aliases.fish

# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/Users/joe/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

# Blank out greeting, who cares
set -g -x fish_greeting ''

test -s /Users/joe/.nvm-fish/nvm.fish; and source /Users/joe/.nvm-fish/nvm.fish
