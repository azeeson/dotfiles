command_exists() {
	command -v "$@" >/dev/null 2>&1
}

command_exists git --version || {
    echo "Test"
}

echo "Print version:"
git --version
