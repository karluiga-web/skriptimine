#!/bin/bash

tekst="koer;kass;hiir"
IFS=';'

for loom in $tekst; do
    echo "Loom: $loom"
done
