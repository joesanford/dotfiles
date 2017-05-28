# General
alias j jobs
alias l ls
alias ll 'ls -lrlah'
alias g git
alias c clear

# Directories
alias cd.. 'cd ..'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'

# Git
alias undopush "git push -f origin HEAD^:master"
alias gd "git diff"
alias gdc "git diff --cached"
alias ga "git add"
alias gca "git commit -a -m"
alias gcm "git commit -m"
alias gbd "git branch -D"
alias gst "git status -sb --ignore-submodules"
alias gm "git merge --no-ff"
alias gpt "git push --tags"
alias gp "git push"
alias grs "git reset --soft"
alias grh "git reset --hard"
alias gb "git branch"
alias gcob "git checkout -b"
alias gco "git checkout"
alias gba "git branch -a"
alias gcp "git cherry-pick"
alias gl "git lg"
alias gpom "git pull origin master"
alias grao "git remote add origin"

#  Mac OS Related
# Flush Directory Service cache
alias flush "dscacheutil -flushcache"

# Empty the Trash
alias emptytrash "rm -rfv ~/.Trash"

# Network Related
alias localip "ipconfig getifaddr en1"
alias ips "ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ and print $1'"
alias whois "whois -h whois-servers.net"

# View HTTP traffic
alias sniff "sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump "sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Print timestamp
function timestamp
    python -c 'import time; print(int(time.time()))'
end

# Look for an executable and if found show version(s) installed
function wtf -d "Print which and --version output for the given command"
    for arg in $argv
        echo $arg: (which $arg)
        echo $arg: (sh -c "$arg --version")
    end
end

# Run nvm with bass
function nvm
     bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end
