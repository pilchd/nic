# If the brew binary is installed, use Homebrew's binaries (Apple silicon)
if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# If Homebrew bash-completion is installed, use it
if [[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]]; then
    source "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
fi
