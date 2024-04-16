# If the brew binary is installed, use Homebrew's binaries (Apple silicon)
if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
