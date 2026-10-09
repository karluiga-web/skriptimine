#!/bin/bash

tund=$(date +%-H)
kasutaja=$(whoami)
kasutaja_vormindatud="${kasutaja^}"

if [ $tund -ge 6 -a $tund -lt 12 ]; then
    echo "Tere hommikust, $kasutaja_vormindatud!"
elif [ $tund -ge 12 -a $tund -lt 18 ]; then
    echo "Tere päevast, $kasutaja_vormindatud!"
elif [ $tund -ge 18 -a $tund -lt 22 ]; then
    echo "Tere õhtust, $kasutaja_vormindatud!"
else
    echo "Head ööd, $kasutaja_vormindatud!"
fi
