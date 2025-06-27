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
    if [[ -f /usr/share/nnn/quitcd/quitcd.bash_sh_zsh ]]; then
        source /usr/share/nnn/quitcd/quitcd.bash_sh_zsh
    fi

    export NNN_BMS="s:$HOME/School/SP24"
    export NNN_FIFO='/tmp/nnn.fifo'
    # Don't auto-enter on single filter match:don't auto-advance:open only on enter
    export NNN_OPTS='AJo'
    export NNN_PLUG='p:preview-tui'
    # Use trash-cli as rm
    # TODO Check installed
    export NNN_TRASH='1'

    # Hidden files first
    alias n='LC_COLLATE=C n'
    alias nnn='LC_COLLATE=C nnn'
fi
