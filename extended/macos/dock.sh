#!/bin/sh

# Dock icon size of 36 pixels.
defaults write com.apple.dock "tilesize" -int "42"

killall Dock