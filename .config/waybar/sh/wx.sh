#!/bin/sh
set -o errexit -o pipefail

curl -fs "wttr.in/$(jq -r .ZIP_CODE ~/.secrets.json)?format=j1" |
jq -cf --unbuffered /dev/fd/3 3<< "EOF"
  def f_wt: wrap("<span color='white' weight='bold'>"; "</span>");

    . as {current_condition: [{$pressure, $temp_F, $uvIndex, $winddir16Point, $windspeedMiles}]}
  | {
    text: "\($temp_F) °F",
    tooltip:
        "<tt>"
      + "Wind   \($windspeedMiles | f_wt) MPH \($winddir16Point | f_wt)\n"
      + "Pressure \($pressure | tonumber | conv__hPa_inHg | fprec(3)) inHg\n"
      + "UV Index \($uvIndex | f_wt)"
      + "</tt>"
  }
EOF
