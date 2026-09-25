#!/bin/bash

for i in {1..3}; do
    echo "Välimine tsükkel i = $i"
    for j in {1..10}; do
        if [ $j -eq 5 ]; then
            echo "Sisemine tsükkel jõudis 5-ni! Katkestan mõlemad."
            break 2
        fi
        echo "  Sisemine j = $j"
    done
done
