# reload zsh config
alias rl='RELOAD=1 source ~/.zshrc'

# general
alias c="clear"
alias l="ls -lAhG"
alias q="exit"
alias k="kill -9"
alias dot="cd ~/.dotfiles && nvim"
alias dotd="cd ~/.dotfiles"
alias abc="echo 'abcdefghijklmnopqrstuvwxyz'"
alias rr='c ; r'

# editing
alias v="nvim"
alias vim='nvim'

# cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias code="cd ~/code"
alias ghn="cd ~/code/github && n"
alias gh="cd ~/code/github"
alias ghj="cd ~/code/github/jrowlingson"
alias ghe="cd ~/code/github/emberjs"
alias ghec="cd ~/code/github/ember-cli"
alias tst="cd ~/code/tst"
alias h="cd ~"

# web dev
alias e="ember"
alias eb="ember b"
alias es="ember s"
alias et="ember t --test-port 0 --watcher=node"
alias etm="ember t -s -m "
alias ember-reset='rm -rf node_modules tmp bower_components dist && yarn && bower install'
alias ember-exam='ember exam --split=4 --parallel && ember coverage-merge'
alias y="yarn"

# git
alias g="git"
alias gl="git log --oneline --decorate --all --graph"
alias gb="git branch"
alias gst="git status"
alias gp="git pull"
alias ga="git add \\."
alias gap="git add -p"
alias gs="git stash"
alias gd="git diff"
alias gdh="git diff HEAD"
alias gsp="git stash pop"
alias gco="git checkout"
alias gcob='git checkout $(git branch | fzf)'
alias gcobr='git checkout --track `git branch -r --sort=committerdate | fzf`'
alias gc="git clone"

# utils
alias urlencode='node -e "console.log(encodeURIComponent(process.argv[1]))"'
alias urldecode='node -e "console.log(decodeURIComponent(process.argv[1]))"'
alias st='open -a SourceTree .'
