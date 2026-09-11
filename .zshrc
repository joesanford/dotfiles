# Environment variables
export SSH_KEY_PATH="~/.ssh/rsa_id"
export ZSH=/usr/share/oh-my-zsh

# ZSH Settings
ZSH_THEME="agnoster"
HYPHEN_INSENSITIVE="true"
ZSH_DISABLE_COMPFIX=true
plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

# Misc Aliases
alias ..="cd .."
alias ...="cd ../../../"
alias ....="cd ../../../../"
alias .....="cd ../../../../"
alias .4="cd ../../../../"
alias .5="cd ../../../../.."
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim \$ZSH"
alias j="jobs"
alias ll="ls -trlah"
alias tb="ncat termbin.com 9999"
alias jctl="journalctl -p 3 -xb"

# Git aliases
alias undopush="git push -f origin HEAD^:main"
alias gd="git diff"
alias gdc="git diff --cached"
alias ga="git add"
alias gca="git commit -a -m"
alias gcm="git commit -m"
alias gbd="git branch -D"
alias gst="git status -sb --ignore-submodules"
alias gm="git merge --no-ff"
alias gpt="git push --tags"
alias gp="git push"
alias grs="git reset --soft"
alias grh="git reset --hard"
alias gb="git branch"
alias gcob="git checkout -b"
alias gco="git checkout"
alias gba="git branch -a"
alias gcp="git cherry-pick"
alias gl="git lg"
alias gpom="git pull origin main"
alias grao="git remote add origin"

# Networking
netiface() { ip route | awk '/default/ {print $5; exit}'; }
alias localip="ip -4 addr show scope global | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -1"
alias ips="ip -4 -o addr show | awk '{print \$2, \$4}'"
alias whois="whois -h whois-servers.net"
alias sniff="sudo ngrep -d \$(netiface) -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i \$(netiface) -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
<<<<<<< Updated upstream
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completionexport PATH="$HOME/.local/bin:$PATH"
=======
[ -s "/usr/share/nvm/init-nvm.sh" ] && . "/usr/share/nvm/init-nvm.sh"
>>>>>>> Stashed changes
