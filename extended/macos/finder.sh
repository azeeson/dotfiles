#!/usr/bin/env bash

###############################################################################
# Mac OS: finder
###############################################################################


# Arrange by
# Kind, Name, Application, Date Last Opened,
# Date Added, Date Modified, Date Created, Size, Tags, None
defaults write com.apple.finder FXPreferredGroupBy -string "Name"

defaults write com.apple.finder DesktopViewSettings -dict-add "GroupBy" "Kind"