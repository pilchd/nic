#!/bin/bash


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

tag() {
    pilchd_tag="$1"
}
alias untag='unset pilchd_tag'

[[ -z ${PILCHD_HUSH+1} ]] && what || hush
# Be quiet if an internal Neovim terminal is detected
[[ -n ${NVIM+1} ]] && hush
[[ -n ${PILCHD_TAG+1} ]] && pilchd_tag="${PILCHD_TAG}"
