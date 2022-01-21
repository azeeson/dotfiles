#!/bin/sh

###############################################################################
# Mac OS: Finder
###############################################################################

# Arrange by
# Kind, Name, Application, Date Last Opened,
# Date Added, Date Modified, Date Created, Size, Tags, None
defaults write com.apple.finder FXPreferredGroupBy -string "Name"

defaults write com.apple.finder DesktopViewSettings -dict-add "GroupBy" "Kind"

# Искать в текущей папке
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Поумолчанию открывать папку пользователя
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME/"

# Поумолчанию открывать любую папку
# defaults write com.apple.finder NewWindowTarget -string "PfLo"
# defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME/work/"

# Отображать папки сверху в finder и на рабочем столе
defaults write com.apple.finder _FXSortFoldersFirst -bool yes
defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool yes

defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool yes

# Set sidebar icon size
defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int 1






# Включить выделение текста в окнах быстрого просмотра
defaults write com.apple.finder QLEnableTextSelection -bool yes

# Всегда показывать скрытые файлы в Finder
defaults write com.apple.finder AppleShowAllFiles -bool YES

# Показывать системную информацию при входе в систему
# sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Всегда показывать папку «Библиотеки»
# chflags nohidden ~/Library/

killall Finder