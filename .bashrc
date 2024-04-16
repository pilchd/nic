## (should) Respects the following variables in the environment:

# PILCHD_HUSH: If set, start the shell with the short prompts
# PILCHD_NOMOTD: If set, do not fortune | cowsay
# PILCHD_TAG: If set, start the shell tagged with the set value


## Shell options

# Stop if this is not an interactive shell
[[ $- != *i* ]] && return

# Don't overwrite on redirection without >|
set -o noclobber
# Exit status of pipeline is leftmost non-zero, else zero
set -o pipefail

# cd on path at prompt
shopt -s autocd
# Refresh terminal size if changed
shopt -s checkwinsize
# Interpret extended globs
shopt -s extglob
# Interpret **
shopt -s globstar
# Append to the history file on exit; don't overwrite with contents of memory
shopt -s histappend


## bash variables

# Load and store all lines of history (go fzf!)
HISTSIZE=-1
HISTFILESIZE=-1

# Ignore duplicate:space-prefaced:1-character:2-character:3-character commands
HISTIGNORE='&:[ ]*:?:??:???'

# Don't write to a history file if root
[[ $EUID -eq 0 ]] && HISTFILE=/dev/null


## Shell environment

# Engineering department
export BC_ENV_ARGS=/home/nic/.config/bc/config

# RIP nano
export EDITOR=nvim

# Use Ubuntu's colorful GCC output
export GCC_COLORS='error=1;31:warning=1;35:note=1;36:caret=1;32:locus=1:quote=1'

# Change the color of other writable (ow) and sticky other writable (tw) used by
# ls to their text colors (blue and yellow) underlined instead of highlighted
# TODO append better
export LS_COLORS=$LS_COLORS:'ow=1;4;34:tw=1;4;33:'

# Append XDG_BIN_HOME (~/.local/bin) to the path
# TODO append better
PATH="${PATH}:$HOME/${XDG_BIN_HOME:-.local/bin}"

# If systemd ssh-agent user service is running, export its socket
if systemctl --user is-active ssh-agent &> /dev/null; then
    export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
fi

# Don't add (.venv) to prompt when using Python venv
export VIRTUAL_ENV_DISABLE_PROMPT=1


## Drop-ins

for file in ~/.bashrc.d/**/*.sh; do
    [[ -r "$file" && ! -x "$file" ]] && source "$file"
done
