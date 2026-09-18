#!/bin/bash

echo -n "Sisesta ridade arv: "
read rida

for (( i = 1; i <= rida; i++ )); do
    echo -n "$i. "
    # Trükime esmalt (rida - i) tükki 'o' sümboleid
    for (( j = 1; j <= rida - i; j++ )); do
        echo -n "o "
    done
    # Trükime seejärel (i) tükki tärne
    for (( k = 1; k <= i; k++ )); do
        echo -n "* "
    done
    echo ""
done
