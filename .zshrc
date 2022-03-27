# Environment variables
export SSH_KEY_PATH="~/.ssh/rsa_id"
export PATH=/opt/homebrew/bin:$PATH
export ZSH=/Users/joe/.oh-my-zsh

# ZSH Settings
ZSH_THEME="agnoster"
HYPHEN_INSENSITIVE="true"
ZSH_DISABLE_COMPFIX=true
plugins=(git)

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
alias zshconfig="atom ~/.zshrc"
alias ohmyzsh="atom ~/.oh-my-zsh"
alias j="jobs"
alias ll="ls -trlah"
alias flush="dscacheutil -flushcache"
alias emptytrash="rm -rfv ~/.Trash"

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
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ and print $1'"
alias whois="whois -h whois-servers.net"
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
