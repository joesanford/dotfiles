# Make my prompt pretty
export PS1="\[\033[32m\]\u@\h \[\033[34m\] \w \$ \[\033[0m\]"
#export PS1="\[\033[31m\]\u@\h:\w\$\[\033[0m\]"

# Aliases
alias ll="ls -trlaG"
alias tufts="ssh joe@homework.cs.tufts.edu"
alias dax="ssh joe@25.193.190.132"
alias ls="ls -G"
alias greyjoy="ssh pi@greyjoy.local"
alias greyjoy-remote="ssh pi@joesanford.endofinternet.net"
alias phone-home="ssh pi@joesanford.endofinternet.net"
alias retropie="ssh pi@retropie.local"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome &"
alias docean="ssh root@104.131.249.150"
alias c120="ssh root@104.131.120.175"
alias clr="clear"
alias djs="open http://localhost:8000 ; ./manage.py runserver"
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