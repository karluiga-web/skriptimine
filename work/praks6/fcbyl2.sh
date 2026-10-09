#!/bin/bash

while true; do
    echo -n "Sisesta arv (0 lõpetab): "
    read nr

    if [ $nr -eq 0 ]; then
        echo "Lõpp!"
        break
    elif [ $nr -lt 0 ]; then
        echo "Negatiivne arv, jätan vahele."
        continue
    fi

    echo "Sisestasid numbri: $nr"
done
