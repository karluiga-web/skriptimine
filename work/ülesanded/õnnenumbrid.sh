#!/bin/bash

for (( i = 1000; i <= 9999; i++ )); do
    summa=$i

    while [ $summa -gt 9 ]; do
        arv=$summa
        summa=0

        while [ $arv -gt 0 ]; do
            jaak=$((arv % 10))
            summa=$((summa + jaak))
            arv=$((arv / 10))
        done
    done

    if [ $summa -eq 7 ]; then
        echo $i
    fi
done
