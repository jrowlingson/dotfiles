#!/usr/bin/env bash

echo "starting install..."

source install/link.sh

# macOS specific install
if [ "$(uname)" == "Darwin" ]; then
  source install/brew.sh
  source install/mac_os.sh
fi

echo -e "\n\n🙌 setup complete. reload your terminal."
