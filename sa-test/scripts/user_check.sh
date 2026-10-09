#!/usr/bin/env bash

username="$1"

if id "$username" >/dev/null 2>&1; then
    echo "Kasutaja $username eksisteerib."
    exit 0
else
    echo "Kasutajat $username ei leitud."
    exit 1
fi
