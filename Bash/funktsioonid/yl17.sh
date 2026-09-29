#!/bin/bash

kontroll() {
    if [ ! -f "$1" ]; then
        echo "Faili pole. Katkestame funktsiooni (return)."
        return 1
    fi

    echo "Fail leitud."
}

kontroll "/tmp/olematu.txt"
echo "Skript jätkab tööd sellest punktist edasi."
