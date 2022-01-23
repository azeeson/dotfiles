#!/bin/sh

finder() {
    defaults write com.apple.finder $@
}

plist_finder() {
    local data="${@:-}"

    [[ ! -z $data ]] && /usr/libexec/PlistBuddy -c "Set ${data}" ~/Library/Preferences/com.apple.finder.plist
    # [[ ! -z $data ]] && /usr/libexec/PlistBuddy -c "Print ${data}" ~/Library/Preferences/com.apple.finder.plist
}

global() {
    defaults write NSGlobalDomain $@
}


###############################################################################
# Mac OS: Finder
###############################################################################

finder FXPreferredViewStyle -string "Nlsv"

for view in 'StandardViewSettings' 'FK_StandardViewSettings'; do
    for type in 'ListViewSettings' 'ExtendedListViewSettingsV2'; do
        plist_finder :$view:$type:sortColumn         string   name # Сортировка по имени
        plist_finder :$view:$type:calculateAllSizes  bool     true # Вычислять все размеры
        plist_finder :$view:$type:useRelativeDates   bool     false # Использовать относительные даты
        plist_finder :$view:$type:showIconPreview    bool     true # Покзывать иконки
    done
done

# Set icon view settings on desktop and in icon views
for view in 'DesktopViewSettings' 'StandardViewSettings' 'FK_StandardViewSettings'; do
    plist_finder :$view:IconViewSettings:arrangeBy string name # Snap-to-grid for icons
    plist_finder :$view:IconViewSettings:showItemInfo bool true # Item info near icons
    plist_finder :$view:IconViewSettings:showIconPreview bool true # Item info near icons
    plist_finder :$view:IconViewSettings:labelOnBottom bool true # Item info to right of icons
    plist_finder :$view:IconViewSettings:gridSpacing integer 54 # Grid spacing for icons
    plist_finder :$view:IconViewSettings:iconSize integer 64 # Icon size
done


# Arrange by
# Kind, Name, Application, Date Last Opened,
# Date Added, Date Modified, Date Created, Size, Tags, None
finder FXPreferredGroupBy -string "Name"

# Искать поумолчанию в текущей папке
finder FXDefaultSearchScope -string "SCcf"

# Поумолчанию открывать папку пользователя
finder NewWindowTarget -string "PfHm"
finder NewWindowTargetPath -string "file://$HOME/"

# Поумолчанию открывать любую папку
# finder NewWindowTarget -string "PfLo"
# finder NewWindowTargetPath -string "file://$HOME/work/"

# Отображать папки сверху в finder и на рабочем столе
finder _FXSortFoldersFirst -bool true
finder _FXSortFoldersFirstOnDesktop -bool true

# Предупреждать при изменении расширения
finder "FXEnableExtensionChangeWarning" -bool true

# Включить выделение текста в окнах быстрого просмотра
finder QLEnableTextSelection -bool true

# Всегда показывать скрытые файлы в Finder
finder AppleShowAllFiles -bool true

# Shows Status Bar
finder ShowStatusBar -bool NO

# Shows Tab View
finder ShowTabView -bool true

# Shows Path Bar
finder ShowPathbar -bool true

# Changes Finder to List View
# Four-letter codes for the other view modes: 'icnv', 'clmv', 'Flwv'
finder FXPreferredViewStyle -string "Nlsv"


#Turns on show Hard Disks, External disks, CDs, DVDs, and iPads, and Connected Servers

finder ShowExternalHardDrivesOnDesktop -bool true

finder ShowHardDrivesOnDesktop -bool false

finder ShowMountedServersOnDesktop -bool false

finder ShowRemovableMediaOnDesktop -bool true

# Открывать папки в новой вкладке, а не окне
finder FinderSpawnTab -bool true

# Set sidebar icon size
global "NSTableViewDefaultSizeMode" -int 1





#########


# Показывать системную информацию при входе в систему
# sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Всегда показывать папку «Библиотеки»
# chflags nohidden ~/Library/
finder DesktopViewSettings -dict-add "GroupBy" "Kind"



killall Finder


exit 0