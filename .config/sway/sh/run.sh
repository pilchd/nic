#!/bin/sh

chances=(
    2767
    32767
)
runners=(
    ~/.theme/run1
    ~/.theme/run0
)
sayings=(
    "Don't be so silly!"
    "Jambo Nintendo!"
)

play='pw-cat --volume=0.25 -p'


random=$RANDOM
for idx in ${!chances[@]} ; do
    if (($random <= ${chances[idx]})); then
        export RUNNER_SAYING="${sayings[idx]}"

        { sh -c "$*" <&3 3<&- & } 3<&0 ; pid_command=$!
        $play "${runners[idx]}" & pid_runner=$!

        wait $pid_command ; return=$?

        kill $pid_runner
        exit $return
    fi
done
