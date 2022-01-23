#!/bin/sh

curl_repository() {
    curl -fsSL "https://raw.githubusercontent.com/azeeson/dotfiles/main/$1"
}

execute_remote() {
    sh -c "$(curl_repository $1)"
}

echo "Configuration Mac OS: Settings..."
execute_remote extended/macos/settings.sh

echo "Configuration Mac OS: Finder..."
execute_remote extended/macos/finder.sh

echo "Configuration Mac OS: Dock..."
execute_remote extended/macos/dock.sh




#    "com.apple.preference.battery" =         {
# 							      >	            hasBeenWarnedAboutEnergyUsage = 1;
# 							      >	        };