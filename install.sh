command_exists() {
	command -v "$@" >/dev/null 2>&1
}

# Установка xcode утилит, включая git
command_exists git || {
    xcode-select --install
}

# Установка brew
command_exists brew || {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

# Установка visual-studio-code, iterm, sublime-merge
brew install --cask visual-studio-code iterm2 sublime-merge

ln -s "/Applications/Sublime Merge.app/Contents/SharedSupport/bin/smerge" /usr/local/bin/smerge
ln -s "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" /usr/local/bin/code

echo "Print version:"
git --version
brew --version
code --version
smerge --version