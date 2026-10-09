#!/usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
source "$BASE_DIR/config/settings.conf"

DAYS=${1:-7}

if [ ! -d "$BACKUP_DIR" ]; then
    echo "Varukoopiate kausta ei leitud ($BACKUP_DIR)." >&2
    exit 1
fi

echo "Otsitakse ja kustutatakse varukoopiaid, mis on vanemad kui $DAYS päeva..."

DELETED_COUNT=0
while IFS= read -r file; do
    if [ -n "$file" ]; then
        rm -f "$file"
        echo "Kustutatud: $(basename "$file")"
        DELETED_COUNT=$((DELETED_COUNT + 1))
    fi
done < <(find "$BACKUP_DIR" -maxdepth 1 -name "backup_*.tar.gz" -type f -mtime +"$DAYS")

if [ "$DELETED_COUNT" -eq 0 ]; then
    echo "Ühtegi vanemat kui $DAYS päeva varukoopiat ei leitud."
else
    echo "Kokku kustutati $DELETED_COUNT vana varukoopiat."
fi

exit 0
