#!/bin/sh

git config --global core.editor "code --wait"
git config --global core.autocrlf input

git config --global credential.helper osxkeychain

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.hist "!git --no-pager log --pretty=format:'%C(yellow)[%ad]%C(reset) %C(green)[%h]%C(reset) | %C(red)%s %C(bold red){{%an}}%C(reset) %C(blue)%d%C(reset)' --date=short"
git config --global alias.hs "!git --no-pager log --pretty=format:'%C(bold green)%h%C(reset) %ad | %C(bold)%s%d%C(reset) %C(yellow)(%cr) %C(blue)[%an]%C(reset)' --abbrev-commit --date=short -n 20"
git config --global alias.hss "hs --show-signature"
git config --global alias.lg "log --oneline --graph"
git config --global alias.un "reset --soft HEAD~1"

git config --global user.name "Alexander Medkov"
git config --global user.email "azeeson@gmail.com"
git config --global user.url "https://azeeson.com"
git config --global user.signingkey "AF743363899B332E"

git config --global commit.gpgsign true

git config --global gpg.program "$(which gpg)"