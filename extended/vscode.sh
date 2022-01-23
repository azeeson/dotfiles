#!/bin/sh

curl_repository() {
    curl -fsSL "https://raw.githubusercontent.com/azeeson/dotfiles/main/$1"
}

#  --force
cie='code --install-extension'

$cie "aaron-bond.better-comments"
$cie "AppulateInc.filewatcher"
$cie "budparr.language-hugo-vscode"
$cie "darkriszty.markdown-table-prettify"
$cie "dbaeumer.vscode-eslint"
$cie "eamodio.gitlens"
# $cie "foxundermoon.shell-format"
$cie "golang.go"
$cie "HookyQR.beautify"
# $cie "jeff-hykin.better-shellscript-syntax"
$cie "jpoissonnier.vscode-styled-components"
$cie "ms-azuretools.vscode-docker"
$cie "ms-vscode.vscode-typescript-tslint-plugin"
$cie "nidu.copy-json-path"
$cie "rafamel.subtle-brackets"
$cie "randrade23.beautify-json"
$cie "redhat.vscode-yaml"
$cie "shanoor.vscode-nginx"
$cie "streetsidesoftware.code-spell-checker"
$cie "streetsidesoftware.code-spell-checker-russian"
$cie "stylelint.vscode-stylelint"
$cie "xyz.plsql-language"


settings="$(curl_repository settings/vsode.jsonc)"

cat > "$HOME/Library/Application Support/Code/User/settings.json" <<EOF
$settings
EOF
