#!/bin/bash

echo -n "Sisesta ridade arv: "
read rida

echo -n "Sisesta tarnide arv reas: "
read tarn

for (( i = 1; i <= rida; i++ )); do
    echo -n "$i. "
    for (( j = 1; j <= tarn; j++ )); do
        if [ $i -eq 1 -o $i -eq $rida -o $j -eq 1 -o $j -eq $tarn ]; then
            echo -n "* "
        else
            echo -n "  "
        fi
    done
    echo ""
done
