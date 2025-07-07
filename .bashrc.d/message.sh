PASTIME_FILE=~/.pastime.txt


[[ -n ${PILCHD_NOMESS+.} ]] && return

# For the fans
command -v fortune &> /dev/null && command -v cowsay &> /dev/null && fortune | cowsay

[[ -r $PASTIME_FILE ]] && while IFS=, read -r date time form; do
    days=$((($(date -d "$date" +%s) - $(date +%s)) / (60 * 60 * 24) + 1))
    (( days < -6 )) && continue
    (( days <= 0 )) && days="$(_sgr ':)' inc gre)"

    (( ${#time} > tab )) && tab=${#time}

    lines+=("$(_sgr 'Days until' gra) $(_sgr "$time" "${form:-gra}") $(_sgr 'are' gra) %s$(_sgr "$days" red)\n")
    sizes+=(${#time})
done < "$PASTIME_FILE"

printf "$(_sgr 'System time is' gra) %s %s\n" "$(_rep ${tab:-0} ' ')" "$(_sgr "$(date "+%m-%d %a %H:%M")" gre)"

for idx in ${!lines[@]}; do
    printf "${lines[$idx]}" "$(_rep $(( tab - sizes[idx] )) ' ')"
done

printf '\n'
