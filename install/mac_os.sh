#!/usr/bin/env bash

echo -e "\\n\\nsetting macOS settings"
echo "=============================="

echo "finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "finder: show hidden files by default"
defaults write com.apple.Finder AppleShowAllFiles -bool false

echo "finder: show the ~/Library folder"
chflags nohidden ~/Library

echo "finder: use current directory as default search scope"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "finder: show path bar"
defaults write com.apple.finder ShowPathbar -bool true

echo "finder: show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

echo "terminal: only use UTF-8 in Terminal.app"
defaults write com.apple.terminal StringEncodings -array 4

echo "safari: enable debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo "trackpad: enable tap to click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

echo "keyboard: enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "keyboard: disable press-and-hold for keys in favor of key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo "keyboard: set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 2

echo "keyboard: set a shorter Delay until key repeat"
defaults write NSGlobalDomain InitialKeyRepeat -int 15

echo "system: expand save dialog by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo "system: enable subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# echo "disable resume system wide"
# defaults write NSGlobalDomainNSQuitAlwaysKeepWindows -bool false

# echo "enable the 2D Dock"
# defaults write com.apple.dock no-glass -bool true

# echo "automatically hide and show the Dock"
# defaults write com.apple.dock autohide -bool true

# echo "make Dock icons of hidden applications translucent"
# defaults write com.apple.dock showhidden -bool true

# echo "allow quitting Finder via ⌘ + Q; doing so will also hide desktop icons"
# defaults write com.apple.finder QuitMenuItem -bool true

# echo "disable window animations and Get Info animations in Finder"
# defaults write com.apple.finder DisableAllAnimations -bool true

# echo "expand print panel by default"
# defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# echo "disable the “Are you sure you want to open this application?” dialog"
# defaults write com.apple.LaunchServices LSQuarantine -bool false

# echo "enable highlight hover effect for the grid view of a stack (Dock)"
# defaults write com.apple.dock mouse-over-hilte-stack -bool true

# echo "enable spring loading for all Dock items"
# defaults write enable-spring-load-actions-on-all-items -bool true

# echo "show indicator lights for open applications in the Dock"
# defaults write com.apple.dock show-process-indicators -bool true

# don’t animate opening applications from the Dock
# defaults write com.apple.dock launchanim -bool false

# echo "disable auto-correct"
# defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# echo "disable opening and closing window animations"
# defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# echo "disable disk image verification"
# defaults write com.apple.frameworks.diskimages skip-verify -bool true
# defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
# defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# echo "automatically open a new Finder window when a volume is mounted"
# defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
# defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
# defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# echo "display full POSIX path as Finder window title"
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# echo "increase window resize speed for Cocoa applications"
# defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# echo "avoid creating .DS_Store files on network volumes"
# defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# echo "disable the warning when changing a file extension"
# defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# echo "show item info below desktop icons"
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# echo "enable snap-to-grid for desktop icons"
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# echo "disable the warning before emptying the Trash"
# defaults write com.apple.finder WarnOnEmptyTrash -bool false

# echo "empty Trash securely by default"
# defaults write com.apple.finder EmptyTrashSecurely -bool true

# echo "require password immediately after sleep or screen saver begins"
# defaults write com.apple.screensaver askForPassword -int 1
# defaults write com.apple.screensaver askForPasswordDelay -int 0

# echo "make Safari’s search banners default to Contains instead of Starts With"
# defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# echo "remove useless icons from Safari’s bookmarks bar"
# defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# echo "make ⌘ + F focus the search input in iTunes"
# defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add "Target Search Field" "@F"

# echo "disable Resume system-wide"
# defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# echo "disable the “reopen windows when logging back in” option"
# this works, although the checkbox will still appear to be checked.
# defaults write com.apple.loginwindow TALLogoutSavesState -bool false
# defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false

# echo "reset Launchpad"
# [ -e ~/Library/Application\ Support/Dock/*.db ] && rm ~/Library/Application\ Support/Dock/*.db

echo "killing affected applications"
for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done
