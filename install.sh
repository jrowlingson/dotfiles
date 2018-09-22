#!/usr/bin/env bash

echo "starting install..."

source install/link.sh

# macOS specific install
#if [ "$(uname)" == "Darwin" ]; then
#  echo -e "\\n\\nrunningon macOS"
#  
#  source install/brew.sh
#fi

echo "done. reload your terminal."
