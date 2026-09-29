#!/bin/bash

kontrolli_kasutajat() {
    echo "Süsteemi kasutaja: $(whoami)"
}

arvuta_summa() {
    local a="$1"
    local b="$2"
    echo "$((a + b))"
}

kontrolli_kasutajat
summa=$(arvuta_summa 5 15)
echo "Arvutuse tulemus: $summa"
