#!/bin/sh

curl_repository() {
    curl -fsSL "https://raw.githubusercontent.com/azeeson/dotfiles/main/$1"
}

[[ ! -d "$HOME/.oh-my-zsh" ]] && {
    echo "Install oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

[[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]] && {
    echo "Install zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
}

echo "Install settings zsh..."
curl_repository settings/.zshrc > "$HOME/.zshrc"

exit 0
