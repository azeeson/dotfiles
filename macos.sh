

################################################################################
# Misc User Experience                                                         #
################################################################################

# Разворачивает приложение при двойном щелчке по его панели навигации
defaults write -g AppleActionOnDoubleClick -string "Maximize"
# Set the macOS interface style to Dark
defaults write -g AppleInterfaceStyle -string "Dark"
# Plays sound feedback when volume is changed
defaults write -g com.apple.sound.beep.feedback -int 1
# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

################################################################################
# Keyboard                                                                     #
################################################################################

# Set a blazingly fast keyboard repeat rate (even faster than max values via UI)
# Set a blazingly fast keyboard repeat rate
# defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
# defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)

# Enable press and hold for all keys. Requires a reboot to take affect.
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# Disables automatic text completion
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false


###############################################################################
# Google Chrome & Google Chrome Canary                                        #
###############################################################################

# Disable the all too sensitive backswipe on trackpads
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
# Use the system-native print preview dialog
defaults write com.google.Chrome DisablePrintPreview -bool true
# Expand the print dialog by default
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true

################################################################################
# Spotlight                                                                    #
################################################################################

################################################################################
# Date                                                                         #
################################################################################

defaults write NSGlobalDomain AppleICUDateFormatStrings -dict-add "1" "y.MM.dd"

################################################################################
# Language & Region                                                            #
################################################################################

defaults write -g AppleLanguages -array "ru-RU" "en-US"
defaults write -g AppleMeasurementUnits -string "Centimeters"
defaults write -g AppleMetricUnits -bool true

# Set the default temperature unit to Celsius
defaults write -g AppleTemperatureUnit -string "Celsius"

# Hide language menu in the top right corner of the boot screen
# sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool false


################################################################################
# Dock                                                                         #
################################################################################

# Automatically hide and show the Dock
# defaults write com.apple.dock autohide -bool false

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Customize the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0.4

# Set the icon size of Dock items
defaults write com.apple.dock tilesize -int 48

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true






################################################################################
# Finder                                                                       #
################################################################################

# Filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Spring loaded directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Delay for spring loaded directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# New window target
# Computer     : PfCm
# Volume       : PfVo
# $HOME        : PfHm
# Desktop      : PfDe
# Documents    : PfDo
# All My Files : PfAF
# Other…       : PfLo
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Search scope
# This Mac       : SCev
# Current Folder : SCcf
# Previous Scope : SCsp
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Whether icons for HDD, servers, and removable media should show on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Hide status bar
defaults write com.apple.finder ShowStatusBar -bool false

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Full POSIX path as window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# File extension change warning
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool true




# Finder: Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true 
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true


# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool false
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool false
defaults write com.apple.finder OpenWindowForNewRemovableDisk    -bool false


# Preferred view style
# Icon View   : icnv
# List View   : Nlsv
# Column View : clmv
# Cover Flow  : Flwv
# After configuring preferred view style, clear all `.DS_Store` files
# to ensure settings are applied for every directory
# sudo find / -name ".DS_Store" --delete
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"


# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
    General -bool true \
    OpenWith -bool true \
    Privileges -bool true

# View Options
# ColumnShowIcons    : Show preview column
# ShowPreview        : Show icons
# ShowIconThumbnails : Show icon preview
# ArrangeBy          : Sort by
#   dnam : Name
#   kipl : Kind
#   ludt : Date Last Opened
#   pAdd : Date Added
#   modd : Date Modified
#   ascd : Date Created
#   logs : Size
#   labl : Tags
/usr/libexec/PlistBuddy \
    -c "Set :StandardViewOptions:ColumnViewOptions:ColumnShowIcons bool    true" \
    -c "Set :StandardViewOptions:ColumnViewOptions:FontSize        integer 12"    \
    -c "Set :StandardViewOptions:ColumnViewOptions:ShowPreview     bool    true"  \
    -c "Set :StandardViewOptions:ColumnViewOptions:ArrangeBy       string  dnam"  \
    ~/Library/Preferences/com.apple.finder.plist

# Set icon view settings on desktop and in icon views
for view in 'Desktop' 'FK_Standard' 'Standard'; do
    # Item info near icons
    /usr/libexec/PlistBuddy -c "Set :${view}ViewSettings:IconViewSettings:showItemInfo bool true" ~/Library/Preferences/com.apple.finder.plist
    # Item info to right of icons
    /usr/libexec/PlistBuddy -c "Set :${view}ViewSettings:IconViewSettings:labelOnBottom bool true" ~/Library/Preferences/com.apple.finder.plist
    # Snap-to-grid for icons
    /usr/libexec/PlistBuddy -c "Set :${view}ViewSettings:IconViewSettings:arrangeBy string grid" ~/Library/Preferences/com.apple.finder.plist
    # Grid spacing for icons
    /usr/libexec/PlistBuddy -c "Set :${view}ViewSettings:IconViewSettings:gridSpacing integer 54" ~/Library/Preferences/com.apple.finder.plist
    # Icon size
    /usr/libexec/PlistBuddy -c "Set :${view}ViewSettings:IconViewSettings:iconSize integer 64" ~/Library/Preferences/com.apple.finder.plist
done



################################################################################
# Safari                                                                       #
################################################################################

# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

defaults write com.apple.Safari WebKitDeveloperExtras -bool true

# Disable auto-correct
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

defaults write com.apple.Safari.SandboxBroker ShowDevelopMenu -bool true


# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

################################################################################
# Terminal                                                                     #
################################################################################

# Enable Secure Keyboard Entry in Terminal.app. Secure keyboard entry can
# prevent other apps on your computer or the network from detecting and
# recording what you type in Terminal.
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.Terminal SecureKeyboardEntry -bool true

################################################################################
# App Store                                                                    #
################################################################################

# Enable the WebKit Developer Tools in the Mac App Store
defaults write com.apple.appstore WebKitDeveloperExtras -bool true
# Enable Debug Menu in the Mac App Store
defaults write com.apple.appstore ShowDebugMenu -bool true
# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
# Turn off app auto-update
defaults write com.apple.commerce AutoUpdate -bool false
# Allow the App Store to reboot machine on macOS updates
defaults write com.apple.commerce AutoUpdateRestartRequired -bool false


################################################################################
# Photos                                                                       #
################################################################################

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

################################################################################
# Activity Monitor                                                             #
################################################################################

# Activity Monitor: Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5
# Activity Monitor: Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true
# Activity Monitor: Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0 #100
# Activity Monitor: Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage" 
defaults write com.apple.ActivityMonitor SortDirection -int 0
defaults write com.apple.ActivityMonitor showGPUHistoryWindow -bool false









###############################################################################
# Address Book, Dashboard, iCal, TextEdit, and Disk Utility                   #
###############################################################################

defaults write com.apple.DiskUtility SidebarShowAllDevices -bool true

# Auto-play videos when opened with QuickTime Player
defaults write com.apple.QuickTimePlayerX MGPlayMovieOnOpen -bool true