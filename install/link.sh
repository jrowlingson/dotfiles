#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

echo -e "\\n creating symlinks"
echo "======================"
linkables=$(find -H "$DOTFILES" -maxdepth 3 -name '*.symlink')
for file in $linkables ; do
  target="$HOME/.$( basename "$file" '.symlink' )"
  if [ -e "$target" ]; then
    echo "~${target#$HOME} already exists... skipping."
  else 
    echo "creating symlink for $file"
    ln -s "$file" "$target"
  fi
done

echo -e "\\n\\n installing to ~/.config"
echo "======================"
if [ ! -d "$HOME/.config" ]; then
  echo "creating ~/.config"
  mkdir -p "$HOME/.config"
fi

config_files=$( find "$DOTFILES/config" -d 1 2>/dev/null )
for config in $config_files; do
  target="$HOME/.config/$( basename "$config" )"
  if [ -e "$target" ]; then
    echo "~${target#$HOME} already exists... skipping"
  else 
    echo "creating symlink for $config"
    ln -s "$config" "$target"
  fi
done
