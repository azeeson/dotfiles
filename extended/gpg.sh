#!/bin/sh

gpg_config_directory="$HOME/.gnupg"
pinentry_program="$(which pinentry-mac)"

[ ! -d "$gpg_config_directory" ] && mkdir "$gpg_config_directory"

cat > "$gpg_config_directory/gpg.conf" <<EOF
use-agent
default-key 06658063A5197DCE9CB737BAC7933B1EDB8F9907
EOF

cat > "$gpg_config_directory/gpg-agent.conf" <<EOF
pinentry-program ${pinentry_program}
log-file /var/log/gpg-agent.log
# use-standard-socket
enable-ssh-support
default-cache-ttl 600
max-cache-ttl 7200
EOF
