# reload zsh config
alias rl='RELOAD=1 source ~/.zshrc'

# general
alias c="clear"
alias l="ls -lAhG"
alias q="exit"
alias k="kill -9"
alias dot="cd ~/.dotfiles && nvim"
alias dotw="open https://github.com/jrowlingson/dotfiles"
alias dota="cd ~/.dotfiles && nvim zsh/aliases.zsh"
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
alias ghjw="open https://github.com/jrowlingson"
alias ghe="cd ~/code/github/emberjs"
alias ghec="cd ~/code/github/ember-cli"
alias tst="cd ~/code/tst"
alias tut="cd ~/code/tut"
alias h="cd ~"

# web dev
alias e="ember"
alias eb="ember b"
alias es="yarn && ember s"
alias esr="yarn && ember s --port 0"
alias ess="ember s --ssl true --watcher=node"
alias et="ember t --test-port 0 --reporter=dot"
alias etm="ember t -s -m "
alias ember-reset='rm -rf node_modules tmp bower_components dist && yarn && bower install'
alias ember-exam='ember exam --split=4 --parallel && ember coverage-merge'
alias y="yarn"
alias yl="yarn lint:js && yarn lint:hbs && yarn lint:css"

# git
alias g="git"
alias gl="git log --oneline --decorate --all --graph"
alias gb="git branch"
alias gst="git status"
alias gpo='git push origin'
alias gpoh='git push origin HEAD'
alias gp="git pull"
alias ga="git add \\."
alias gap="git add -p"
alias gs="git stash"
alias gd="git diff"
alias gdh="clear && git diff HEAD"
alias gdhi="git diff --cached"
alias gsp="git stash pop"
alias gco="git checkout"
alias gcob='git checkout $(git branch | fzf)'
alias gcobr='git checkout --track `git branch -r --sort=committerdate | fzf`'
alias gc="git commit"

# utils
alias urlencode='node -e "console.log(encodeURIComponent(process.argv[1]))"'
alias urldecode='node -e "console.log(decodeURIComponent(process.argv[1]))"'
alias st='open -a SourceTree .'

# hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

release_notes() {
  last_tag=$1
  end_tag=${2:='HEAD'}
  git log $last_tag..$end_tag --pretty=format:%s | sed 's/^/* /' | sort
}
alias rn='release_notes'
