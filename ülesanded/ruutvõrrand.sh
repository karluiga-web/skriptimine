#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Kasutamine: $0 A B C"
    exit 1
fi

A=$1
B=$2
C=$3

if [ $(echo "$A == 0" | bc -l) -eq 1 ]; then
    echo "Viga: Kordaja A ei tohi olla 0 (see pole ruutvõrrand)!"
    exit 1
fi

D=$(echo "$B^2 - 4 * $A * $C" | bc -l)

if [ $(echo "$D > 0" | bc -l) -eq 1 ]; then
    x1=$(echo "scale=10; (-($B) + sqrt($D)) / (2 * $A)" | bc -l)
    x2=$(echo "scale=10; (-($B) - sqrt($D)) / (2 * $A)" | bc -l)

    echo "Võrrandil on kaks lahendit:"
    printf "x1 = %.5f\n" "$x1"
    printf "x2 = %.5f\n" "$x2"

elif [ $(echo "$D == 0" | bc -l) -eq 1 ]; then
    x=$(echo "scale=10; -($B) / (2 * $A)" | bc -l)

    echo "Võrrandil on üks lahend:"
    printf "x = %.5f\n" "$x"

else
    echo "Reaalarvulised lahendid puuduvad."
fi
