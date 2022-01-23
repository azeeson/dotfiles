#!/bin/sh

curl_repository() {
    curl -fsSL "https://raw.githubusercontent.com/azeeson/dotfiles/main/$1"
}

echo "Install oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sleep 15

echo "Install zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting


settings="$(curl_repository settings/.zshrc)"

echo "Install settings zsh..."
cat > "$HOME/.zshrc" <<EOF
$settings
EOF



# /usr/libexec/PlistBuddy -c "Delete :'New Bookmarks':0:'Normal Font'" ~/Library/Preferences/com.googlecode.iterm2.plist
# /usr/libexec/PlistBuddy -c "Add :'New Bookmarks':0:'Normal Font' string 'Hasklig-Regular 12'" ~/Library/Preferences/com.googlecode.iterm2.plist


# /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# float Transparency = "0.090"


# BUNDLE_ID=$()

# /usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Normal Font' 'Hasklig-Regular 12'" ~/Library/Preferences/com.googlecode.iterm2.plist
# /usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Transparency' '0.090'" ~/Library/Preferences/com.googlecode.iterm2.plist

# /usr/libexec/PlistBuddy -c "Print :'New Bookmarks':0:'Normal Font'" ~/Library/Preferences/com.googlecode.iterm2.plist

# /usr/libexec/PlistBuddy -c "Print :'New Bookmarks':0:'Transparency'" ~/Library/Preferences/com.googlecode.iterm2.plist

    # string
    #      array
    #      dict
    #      bool
    #      real
    #      integer
    #      date
    #      data