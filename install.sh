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

git clone git@github.com:azeeson/dotfiles.git ~/dotfiles

cd ~/dotfiles


