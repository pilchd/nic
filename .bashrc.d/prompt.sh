_if() {
    [[ -n ${1:+.} && $1 != 0 ]] && printf %s "$2" || printf %s "$3"
}
_pc() {
    _sgr_p "$1" inc gra
}

PROMPT_COMMAND='_rc=$? ; _xterm_tp "$(_if "$PILCHD_TAG" "[$PILCHD_TAG] ")${USER}@${HOSTNAME} $(dirs -p | tac | paste -s -d " ")"'
declare -A _PS=(
    [what]="\$(_if \\j \"$(_pc '|')$(_sgr_p '\j' mag)$(_pc '|')\")$(_pc '[')$(_sgr_p '\u' gre)$(_pc '@')$(_sgr_p '\h' cya)$(_pc ':')\$(_if \"\$PILCHD_TAG\" \"$(_sgr_p "\$PILCHD_TAG" gre)\" \"$(_sgr_p '\W' blu)\")$(_pc ']')\$(_if \$_rc \"$(_sgr_p '$(_rep $SHLVL "\$")' red)\" \"\$(_rep \$SHLVL \"\\\$\")\") "
    [hush]="\$(_if \\j \"$(_sgr_p '\j ' mag)\")\$(_if \$_rc \"$(_sgr_p '$(_rep $SHLVL "\$")' red)\" \"$(_sgr_p '$(_rep $SHLVL "\$")' gre)\") "
    [none]="\\\$ "
)

prompt() {
    export PILCHD_PROMPT=${1:-what} ; PS1="${_PS[$PILCHD_PROMPT]}";
} ; prompt $PILCHD_PROMPT
tag() {
    export PILCHD_TAG="${1:-}"
}

alias what='prompt what'
alias hush='prompt hush'
alias none='prompt none'


[[ $NVIM ]] && { SHLVL=1 ; hush ; }
