## Respects the following variables in the environment:

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


## Prompt helpers

P_sw() {
    case $1 in
        L)
            echo -n "$2"
        ;;
        S)
            echo -n "$3"
        ;;
    esac
}
P_wp() {
    echo -n "${C_BGRY}${1}${2}${C_BGRY}${3}"
}


## PC builders

PC_tg() {
    P_sw $1 \
    '${pilchd_tag:+"[${pilchd_tag}] "}' \
    '${pilchd_tag:+"[${pilchd_tag}] "}'
}
PC_uh() {
    P_sw $1 \
    '${USER}@${HOSTNAME}' \
    ''
}
PC_wd() {
    P_sw $1 \
    ':$(basename "$PWD")' \
    '$(basename "$PWD")'
}
PC() {
    echo -n "echo -n \"]2;$(PC_tg $1)$(PC_uh $1)$(PC_wd $1)\""
}


## PS builders

C_BLU='[0;34m'
C_CYN='[0;36m'
C_GRN='[0;32m'
C_BGRN='[1;32m'
C_BGRY='[1;90m'
C_NO='[0m'
C_PPL='[0;35m'
C_RED='[0;31m'
C_YEL='[0;33m'
C_BYEL='[1;33m'

PS_rt() {
    P_sw $1 \
    "\$(q=\${?##0} ; echo \${q:+\"$(P_wp '(' "${C_RED}\${q}" ')')\"})" \
    "\$(q=\${?##0} ; echo \${q:+\"${C_RED}\${q} \"})"
}
PS_jb() {
    P_sw $1 \
    "\$(j=\\j ; j=\${j##0} ; echo \${j:+\"$(P_wp '|' "${C_PPL}\${j}" '|')\"})" \
    "\$(j=\\j ; j=\${j##0} ; echo \${j:+\"${C_PPL}\${j} \"})"
}
PS_hd() {
    P_sw $1 \
    "$(P_wp '[' "${C_GRN}\${pilchd_tag:-\\u${C_BGRY}@${C_CYN}\\h}${C_BGRY}:${C_BLU}\\W" ']')" \
    "${C_GRN}\${pilchd_tag:+\"\$pilchd_tag \"}"
}
PS_pt() {
    P_sw $1 \
    "${C_NO}\\\$ " \
    "${C_BGRN}\\\$${C_NO} "
}
PS() {
    echo -n "$(PS_rt $1)$(PS_jb $1)$(PS_hd $1)$(PS_pt $1)"
}


## Set prompts and prompt switching

what() {
    PROMPT_COMMAND="$(PC L)"
    PS1="$(PS L)"
}
hush () {
    PROMPT_COMMAND="$(PC S)"
    PS1="$(PS S)"
}
PS2="${C_BGRY}\\!... ${C_BYEL}>${C_NO} "

[[ -z ${PILCHD_HUSH+1} ]] && what || hush
[[ -n ${PILCHD_TAG+1} ]] && pilchd_tag="${PILCHD_TAG}"


## bash aliases

tag() {
    pilchd_tag="$1"
}
alias untag='unset pilchd_tag'

[[ -r ~/.bashrc.d/aliases.sh ]] && source ~/.bashrc.d/aliases.sh


## Plugins

# If extended bash completion is available, source it
if [[ -r /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
fi

## If git-prompt is available, source and configure it (defining __git_ps1())
#if [[ -r ~/.bash_git-prompt.sh ]]; then
#    source ~/.bash_git-prompt.sh
#
#    GIT_PS1_COMPRESSSPARSESTATE=1
#    GIT_PS1_DESCRIBE_STYLE='default'
#    GIT_PS1_SHOWCONFLICTSTATE=1
#    GIT_PS1_SHOWDIRTYSTATE=1
#    GIT_PS1_SHOWSTASHSTATE=1
#    GIT_PS1_SHOWUNTRACKEDFILES=1
#    GIT_PS1_SHOWUPSTREAM='auto verbose'
#    GIT_PS1_STATESEPARATOR=':'
## If git-prompt is unavailable, give no git output (define no-op __git_ps1())
#else
#    __git_ps1() {}
#fi

# If fzf is available, source and configure it
if command -v fzf &> /dev/null; then

    # If the native integration command is availabie (fzf>=0.48.0), use it
    if fzf --bash &> /dev/null; then
        eval "$(fzf --bash)"
        # Otherwise (on Debian), source the keybinding script (completion is defaulted)
    else
        source /usr/share/doc/fzf/examples/key-bindings.bash
    fi

    export FZF_DEFAULT_OPTS='--layout reverse --info inline-right --bind ctrl-h:preview-down,ctrl-l:preview-up'
    export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers,changes --line-range :99 -- {}' --bind 'ctrl-/:change-preview-window(hidden|)'"
    # If fd is available, use it for C-t
    if command -v fd > /dev/null; then
        export FZF_DEFAULT_COMMAND='fd -tf .'
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    fi
fi

# If nvm is available, source and configure it
if [[ -r /usr/share/nvm/nvm.sh ]]; then
    # Defer loading Node.js/npm until explicit `nvm use`
    source /usr/share/nvm/nvm.sh --no-use
    if [[ -r /usr/share/nvm/bash_completion ]]; then
        source /usr/share/nvm/bash_completion
    fi

    export NVM_DIR="${HOME}/.nvm"
fi

# If nnn is available, source and configure it
# https://raw.githubusercontent.com/jarun/nnn/master/misc/quitcd/quitcd.bash_sh_zsh
if command -v nnn &> /dev/null; then
    if [ -f /usr/share/nnn/quitcd/quitcd.bash_sh_zsh ]; then
        source /usr/share/nnn/quitcd/quitcd.bash_sh_zsh
    fi

    export NNN_BMS="s:$HOME/School/SP24"
    export NNN_FIFO='/tmp/nnn.fifo'
    # Don't auto-enter on single filter match:don't auto-advance:open only on enter
    export NNN_OPTS='AJo'
    export NNN_PLUG='p:preview-tui'
    # Use trash-cli as rm
    export NNN_TRASH='1'

    # Hidden files first
    alias n='LC_COLLATE="C" n'
    alias nnn='LC_COLLATE="C" nnn'
fi

# Be quiet if an internal Neovim terminal is detected

[[ -n ${NVIM+1} ]] && hush


## Message of the Day™

# Let kitty settle
[[ ! -z $KITTY_PID ]] && sleep .05

# MOTD only in kitty and if permitted
[[ -n $KITTY_PID && -z ${PILCHD_NOMOTD+1} ]] && ~/.bashrc.d/motd.sh
