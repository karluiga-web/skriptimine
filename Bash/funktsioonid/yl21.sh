#!/bin/bash

kontrolli_sisend() {
    if [ $# -lt 2 ]; then
        echo "Viga: vajalik on vähemalt 2 argumenti!"
        return 1
    fi
    return 0
}

arvuta_tulemus() {
    local x="$1"
    local y="$2"
    echo "$((x * y))"
}

kuva_tulemus() {
    local val="$1"
    echo "Tulemus: $val"
}

# Pealoogika
if kontrolli_sisend "$@"; then
    tulemus=$(arvuta_tulemus "$1" "$2")
    kuva_tulemus "$tulemus"
fi
