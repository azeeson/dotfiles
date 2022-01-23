#!/bin/sh

[[ ! -d "$HOME/bin" ]] && {
    mkdir "$HOME/bin"
}


cat > "$HOME/bin/idea" <<EOF
#!/bin/sh

open -na "IntelliJ IDEA.app" --args "$@"
EOF

chmod +x "$HOME/bin/idea"

exit 0