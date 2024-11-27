ZIP=55060

set -e
set -o pipefail

wx=$( \
    curl -s "wttr.in/${ZIP}?format=j1" \
    | jq -r --unbuffered --compact-output \
        '.current_condition[0] | {temperature: .temp_F, wind: .windspeedMiles, windDir: .winddir16Point, pressure: .pressure, uv: .uvIndex}' \
)

temperature=$(echo $wx | jq -r '.temperature')
wind=$(echo $wx | jq -r '.wind')
windDir=$(echo $wx | jq -r '.windDir')
pressure=$(echo "scale=3 ; $(echo $wx | jq -r '.pressure') / 33.864" | bc)
uv=$(echo $wx | jq -r '.uv')

SPAN_FG="<span color='#ABB2BF'>"
SPAN_WT="<span color='white' weight='bold'>"
CSPAN='</span>'
text="${SPAN_FG}${temperature}${CSPAN} ${SPAN_FG}°F${CSPAN}"
tooltip="<tt>${SPAN_FG}Wind${CSPAN}     ${SPAN_WT}${wind}${CSPAN} ${SPAN_FG}MPH${CSPAN} ${SPAN_WT}${windDir}${CSPAN}\n${SPAN_FG}Pressure${CSPAN} ${SPAN_WT}${pressure}${CSPAN} ${SPAN_FG}inHg${CSPAN}\n${SPAN_FG}UV Index${CSPAN} ${SPAN_WT}${uv}${CSPAN}</tt>"

echo "{\"text\":\"$text\",\"tooltip\":\"$tooltip\"}"
