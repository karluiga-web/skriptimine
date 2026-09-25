#!/bin/bash

echo -n "Sisesta reisijate arv grupis: "
read reisijad

echo -n "Sisesta kohtade arv bussis: "
read kohad

taidetud_bussid=$(expr $reisijad / $kohad)

mahajaand=$(expr $reisijad % $kohad)

echo "Täielikult täidetud busse: $taidetud_bussid"
echo "Maha jäänud reisijaid: $mahajaand"
