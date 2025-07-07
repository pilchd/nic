declare -A _SGR_N=(
    [nor]=0 [inc]=1 [dec]=2 [ita]=3 [und]=4 [slo]=5 [rap]=6 [inv]=7 [con]=8 [str]=9
    [bla]=30 [red]=31 [gre]=32 [yel]=33 [blu]=34 [mag]=35 [cya]=36 [whi]=37
    [gra]=90 [bre]=91 [bgr]=92 [bye]=93 [bbl]=94 [bma]=95 [bcy]=96 [bwh]=97
)
_sgr() {
    string="$1" ; shift
    args=$(for arg in $@ ; do printf "${_SGR_N[$arg]};" ; done)

    printf '\e[%sm%s\e[m' ${args%?} "$string"
}
_sgr_p() {
    string="$1" ; shift
    args=$(for arg in $@ ; do printf "${_SGR_N[$arg]};" ; done)

    printf '\\[\e[%sm\\]%s\\[\e[m\\]' ${args%?} "$string"
}

_xterm_tp() {
    printf '\033]2;%s\007' "$1"
}
