#!/usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
source "$BASE_DIR/config/settings.conf"

DATE=$(date '+%Y%m%d_%H%M%S')
ARCHIVE="$BACKUP_DIR/backup_$DATE.tar.gz"

mkdir -p "$BACKUP_DIR"

if [ ! -d "$BACKUP_SOURCE" ]; then
    echo "Varukoopia ebaõnnestus: lähtekausta ei leitud ($BACKUP_SOURCE)." >&2
    exit 1
fi

echo "Varukoopia loomine..."

tar -czf "$ARCHIVE" -C "$BACKUP_SOURCE" . 2>/dev/null

if [ -s "$ARCHIVE" ]; then
    echo "Varukoopia valmis: $ARCHIVE"
    echo "Failide arv: $(tar -tzf "$ARCHIVE" | wc -l)"
    exit 0
else
    echo "Varukoopia ebaõnnestus."
    exit 1
fi
