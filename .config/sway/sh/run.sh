#!/bin/sh

RUN0=~/.theme/run0
RUN1=~/.theme/run1

PLAY='pw-cat -p'
VOLUME=0.25

TMP=$XDG_RUNTIME_DIR

# ~95%
if (( $RANDOM < 31000 )); then
    echo 0 > ${TMP}/run.ner
    $PLAY --volume=$VOLUME "$RUN0" &
# ~5%
else
    echo 1 > ${TMP}/run.ner
    $PLAY --volume=$VOLUME "$RUN1" &
fi

echo $! > ${TMP}/run.pid
