# Make my prompt pretty
export PS1="\[\033[32m\]\u@\h \[\033[34m\] \w \$ \[\033[0m\]"
#export PS1="\[\033[31m\]\u@\h:\w\$\[\033[0m\]"

# Aliases
alias ll="ls -trlah"
alias ..="cd .."
alias ...="cd ../../../"
alias ....="cd ../../../../"
alias .....="cd ../../../../"
alias .4="cd ../../../../"
alias .5="cd ../../../../.."
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias ports='netstat -tulanp'

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

source ~/.profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/sbin:$PATH
