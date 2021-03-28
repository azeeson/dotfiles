brew update
brew bundle

sh macos.sh
sh extended/macos/settings.sh
sh extended/dropbox.sh

echo "Print version:"
git --version
brew --version
code --version
smerge --version