#!/bin/bash

echo "Arvutan SHA-256 kontrollsummad..."
find . -maxdepth 1 -type f ! -name "*.sha256" ! -name "checksums.txt" -print0 | xargs -0 sha256sum > checksums.txt
echo "Kontrollsummad salvestatud faili checksums.txt"
echo "Kontrollin failide terviklust:"
sha256sum -c checksums.txt
