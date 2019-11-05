#!/bin/bash

INPUT="/input"
OUTPUT="/output"

fonts=( $(find ${INPUT}/ -type f -regex '.*\.\(otf\|ttf\)$') )

if [ ${#fonts[@]} -eq 0 ]; then
    echo "No fonts (.otf|.ttf) found in ${INPUT}"
    exit 1
fi

for font in "${fonts[@]}"; do
    echo "Patching font ${font}"
    fontforge -script font-patcher -out ${OUTPUT}/ "$@" "${font}"
done

exit 0