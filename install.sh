command_exists() {
	command -v "$@" >/dev/null 2>&1
}

command_exists git || {
    xcode-select --install
}

command_exists brew || {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

echo "Print version:"
git --version
brew --version
