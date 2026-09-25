#!/bin/bash

echo -n "Sisesta reisijate arv: "
read reisijad

echo -n "Sisesta kohtade arv bussis: "
read kohad

bussid=$(expr $reisijad / $kohad)
jaak=$(expr $reisijad % $kohad)

if [ $jaak -gt 0 ]; then
    bussid=$(expr $bussid + 1)
fi

echo "Kokku on vaja $bussid bussi"
