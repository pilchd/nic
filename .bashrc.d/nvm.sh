# TODO better failure codes
function source_nvm {
    [[ -r "$1" ]] && source "$1" --no-use || return 1
    [[ -r "$2" ]] && source "$2"
    return 0
}

# Arch Linux
source_nvm \
    "/usr/share/nvm/nvm.sh" \
    "/usr/share/nvm/bash_completion" \
    && return 0
# macOS & Homebrew (Apple silicon)
source_nvm \
    "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" \
    "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" \
    && return 0

return 1
