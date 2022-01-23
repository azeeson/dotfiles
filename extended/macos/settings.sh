#!/bin/sh

###############################################################################
# Mac OS: Settings
###############################################################################

# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "mbp21a"
sudo scutil --set HostName "mbp21a"
sudo scutil --set LocalHostName "mbp21a"

# LockScreen: Set Lock Message to show on login screen
defaults write com.apple.loginwindow LoginwindowText -string "Found me? Shoot a mail to azeeson@gmail.com to return me. Thanks!"

# Отображать всегда расширение файлов
defaults write NSGlobalDomain AppleShowAllExtensions -bool yes

defaults write com.apple.Finder "AppleShowAllFiles" -bool "false"

# Использовать Caps Lock для переключения раскладки
defaults write NSGlobalDomain TISRomanSwitchState -bool yes