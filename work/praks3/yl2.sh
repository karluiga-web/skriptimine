#!/bin/bash
echo ""

echo -n "Sisesta aluskandiku pikkus (cm): "
read kandik_pikkus

echo -n "Sisesta aluskandiku laius (cm): "
read kandik_laius

echo -n "Sisesta ühe küpsise pikkus (cm): "
read kypsis_pikkus

echo -n "Sisesta ühe küpsise laius (cm): "
read kypsis_laius

echo -n "Sisesta tordi kihtide arv: "
read kihte

echo -n "Sisesta küpsiste arv ühes pakis: "
read pakis

# Arvutus
pikkuses=$(expr $kandik_pikkus / $kypsis_pikkus)
laiuses=$(expr $kandik_laius / $kypsis_laius)
yhes_kihis=$(expr $pikkuses \* $laiuses)
kokku_kypsiseid=$(expr $yhes_kihis \* $kihte)
pakkide_arv=$(expr \( $kokku_kypsiseid + $pakis - 1 \) / $pakis)

echo "Tordi valmistamiseks on vaja $kokku_kypsiseid küpsist."
echo "Poest tuleb osta $pakkide_arv pakki küpsiseid."

echo ""
