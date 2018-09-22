#!/usr/bin/env bash

if test ! "$(which brew)"; then
  echo "installing homebrew"
  ruby -e "$( curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install )"
fi

formulas=(
  fzf
  neovim
  node
  python
  ripgrep
  tmux
  yarn
  zsh
)

for formula in "${formulas[@]}"; do
  formula_name=$( echo "$formula" | awk '{print $1}' )
  if brew list "$formula_name" > /dev/null 2>&1; then
    echo "$formula_name already installed... skipping."
  else
    echo "installing $formula..."
    brew install "$formula"
  fi
done

# after the install, setup fzf
echo -e "\\n\\nrunning fzf install script..."
echo -e "==================================="
$(brew --prefix)/opt/fzf/install --all --no-bash --no-fish

# install neovim python libraries
echo -e "\\n\\nrunning neovim python install"
echo -e "==================================="
pip2 install --user neovim
pip3 install --user neovim

# change the default shell to zsh
zsh_path="$( which zsh )"
if ! grep "$zsh_path" /etc/shells; then
  echo "adding $zsh_path to /etc/shells"
  echo "$zsh_path" | sudo tee -a /etc/shells
fi

if [[ "$SHELL" != "$zsh_path" ]]; then
  chsh -s "$zsh_path"
  echo "default shell chagned to $zsh_path" 
fi 
