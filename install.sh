#!/bin/sh

mode=${1:-'all'}

check_mode() {
    [[ $mode == "all" || $mode == $1 ]]
}

curl_repository() {
    curl -fsSL "https://raw.githubusercontent.com/azeeson/dotfiles/main/$1"
}

execute_remote() {
    sh -c "$(curl_repository $1)"
}

command_exists() {
	command -v "$@" >/dev/null 2>&1
}


# Install Xcode Command Line Tools
xcode-select -p >/dev/null 2>&1 || {
    echo "Install Xcode Command Line Tools..."
    sudo xcode-select --install

    # Waiting installed git
    echo "Waiting installed git..."
    while true
    do
        man git >/dev/null 2>&1 && break || sleep 15
    done
}

# Install Homebrew
command_exists brew || {
    echo "Install Homebrew..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

# Installed Homebrew packages
check_mode "brew" && command_exists brew && {
    echo "Installed Homebrew packages..."
    brewfile="$(curl_repository Brewfile)"
    brew update
    brew bundle --file=- <<< "$brewfile"
}

# Configuration MacOS
check_mode "macos" && {
    echo "Configuration Mac OS..."
    execute_remote "extended/macos.sh"
}

# Configuration Apps
check_mode "apps" && {
    echo "Configuration Apps..."
    execute_remote "extended/gpg.sh"
    execute_remote "extended/git.sh"
    execute_remote "extended/npm.sh"
    execute_remote "extended/dropbox.sh"
    execute_remote "extended/synology.sh"
    execute_remote "extended/vscode.sh"
    execute_remote "extended/shell.sh"
    execute_remote "extended/add_links.sh"
}


# echo "Print version:"
# git --version
# brew --version
# code --version
# smerge --version
