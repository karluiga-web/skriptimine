#!/bin/bash

for i in {1..10}; do
    if [ $i -eq 7 ]; then
        echo "Jõudsin 7-ni, katkestan tsükli."
        break
    fi
    echo "i = $i"
done
