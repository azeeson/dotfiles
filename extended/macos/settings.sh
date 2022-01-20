#!/bin/sh

###############################################################################
# Mac OS: Settings
###############################################################################

# LockScreen: Set Lock Message to show on login screen
defaults write com.apple.loginwindow LoginwindowText -string "Found me? Shoot a mail to azeeson@gmail.com to return me. Thanks!"

# Отображать всегда расширение файлов
defaults write NSGlobalDomain AppleShowAllExtensions -bool yes