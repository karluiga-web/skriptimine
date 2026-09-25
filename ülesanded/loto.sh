#!/bin/bash

ajutine_fail="loto_tmp.txt"
> "$ajutine_fail"

while [ $(wc -l < "$ajutine_fail") -lt 5 ]; do
    nr=$(( RANDOM % 50 + 1 ))

    if ! grep -q -x "$nr" "$ajutine_fail"; then
        echo "$nr" >> "$ajutine_fail"
    fi
done

numbrid=$(tr '\n' ' ' < "$ajutine_fail")
kuupaev=$(date "+%Y-%m-%d %H:%M:%S")

echo "Kuidas soovite tulemust väljastada?"
echo "1) Kuva terminalis"
echo "2) Salvesta faili"
echo -n "Sisesta valik (1 või 2): "
read valik

if [ "$valik" -eq 1 ]; then
    echo "Lotonumbrid ($kuupaev): $numbrid"
elif [ "$valik" -eq 2 ]; then
    echo "$kuupaev - Lotonumbrid: $numbrid" >> lototulemused.txt
    echo "Tulemused salvestati faili lototulemused.txt"
else
    echo "Tundmatu valik!"
fi

rm -f "$ajutine_fail"
