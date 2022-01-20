cask_args appdir: "/Applications"

# Taps
tap "homebrew/bundle"
tap "homebrew/core"
tap "homebrew/cask"
tap "homebrew/cask-fonts"
tap "homebrew/cask-drivers"

# Programming languages
# brew "go"
brew "node@16", conflicts_with: ["node"], link: true

brew "gnupg"
brew "pinentry-mac"
brew "docker"
brew "docker-compose"
# 127.0.0.1:8384
brew "syncthing", restart_service: true
# brew "hugo"
# brew "nginx"
# brew "unrar"
# Mac App Store command line interface
# brew 'mas'


cask "alfred", require_sha: true
cask "dropbox", require_sha: false
cask "visual-studio-code", require_sha: true
cask "iterm2", require_sha: true
cask "goland", require_sha: true
cask "telegram", require_sha: true
cask "intellij-idea", require_sha: true
cask "sublime-merge", require_sha: true
cask "spotify", require_sha: false
cask "synology-drive", require_sha: true
cask "figma", require_sha: true
cask "zoom", require_sha: true
# cask "dash"

# Browsers
cask "google-chrome", require_sha: false

# Fonts
cask "font-fira-code", require_sha: true
cask "font-hasklig", require_sha: true

# mas "1Password", id: 443987910