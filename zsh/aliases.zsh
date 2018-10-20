# reload zsh config
alias reload!='RELOAD=1 source ~/.zshrc'

# general
alias c="clear"
alias l="ls -laG"
alias q="exit"
alias k="kill -9"

# editing
alias dot="cd ~/.dotfiles && nvim"
alias v="nvim"
alias vim='nvim'

# cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias code="cd ~/code"
alias gh="cd ~/code/github"
alias ghj="cd ~/code/github/jrowlingson"
alias ghe="cd ~/code/github/emberjs"
alias ghec="cd ~/code/github/ember-cli"
alias h="cd ~"

# web dev
alias e="ember"
alias et="ember t"
alias etm="ember t -s -m "
alias es="ember s"
alias ember-reset='rm -rf node_modules tmp bower_components dist && yarn && bower install'
alias ember-exam='ember exam --split=4 --parallel && ember coverage-merge'
alias y="yarn"

# git
alias g="git"
alias gl="git l"
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
