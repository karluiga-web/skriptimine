#/bin/bash

echo "Vali teenus:"
echo "1 - nginx"
echo "2 - apache2"
read -p "Sisesta valik (1 või 2): " VALIK

if [ "$VALIK" = "1" ]; then
    TEENUS="nginx"
    TEINE="apache2"
elif [ "$VALIK" = "2" ]; then
    TEENUS="apache2"
    TEINE="nginx"
else
    echo "Vale valik! >:D "
    exit 1
fi

if systemctl is-active --quiet $TEINE; then
    echo "Peatame $TEINE, et port 80 vabastada..."
    sudo service $TEINE stop
fi

OLEK=$(dpkg-query -W -f='${Status}' $TEENUS 2>/dev/null | grep -c 'ok installed')

if [ $OLEK -eq 0 ]; then
    echo "Paigaldame $TEENUS"
    sudo apt update
    if sudo apt install -y $TEENUS; then
        sudo service $TEENUS start
        echo "$TEENUS on paigaldatud :D "
        echo "Veebilehte saad kontrollida aadressil: http://192.168.41.187"
    else
        echo "Viga: $TEENUS paigaldamine ebaõnnestus! :( "
    fi
elif [ $OLEK -eq 1 ]; then
    echo "$TEENUS on juba paigaldatud :D "
    sudo service $TEENUS start
    sudo service $TEENUS status
fi
