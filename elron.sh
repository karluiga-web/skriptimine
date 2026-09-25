#!/bin/bash

# Värvikoodid terminali väljundi jaoks
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # Värvi lähtestamine (No Color)

# 1. Menüü kuvamine
echo "ELRONI RONGIINFO"
echo ""
echo "Vali marsruut:"
echo ""
echo "1 - Tartu → Tallinn"
echo "2 - Tartu → Valga"
echo "3 - Tartu → Koidula"
echo ""
echo -n "Sisesta valik: "
read valik

# 2. Sisendi kontrollimine (kas valik jäi sisestamata)
if [ -z "$valik" ]; then
    echo "Valik jäi sisestamata."
    exit 1
fi

# Marsruudi määramine vastavalt valikule
case "$valik" in
    1)
        lahtejaam="Tartu"
        sihtjaam="Tallinn"
        ;;
    2)
        lahtejaam="Tartu"
        sihtjaam="Valga"
        ;;
    3)
        lahtejaam="Tartu"
        sihtjaam="Koidula"
        ;;
    *)
        echo "Vigane valik!"
        exit 1
        ;;
esac

# 3. Päring Elroni API-sse
api_vastus=$(curl -s "https://elron.ee/live-map/stop/$lahtejaam")

# Päringu õnnestumise kontroll
if [ $? -ne 0 ] || [ -z "$api_vastus" ]; then
    echo "Elroni API päring ebaõnnestus."
    exit 1
fi

# 4. & 5. & 7. Tekstitöötlus ja filtreerimine (ilma JSON-parserita)
# Tükeldame rea objektideks, filtreerime sihtjaama ja eraldame plaanilise aja
ajad=$(echo "$api_vastus" | tr '}' '\n' | grep "\"sihtjaam\":\"$sihtjaam\"" | grep -o "\"plaaniline_aeg\":\"[0-9]\{2\}:[0-9]\{2\}\"" | cut -d'"' -f4)

# 6. Kontrolli, kas sobivaid ronge leiti
if [ -z "$ajad" ]; then
    echo "Sobivaid ronge ei leitud."
    exit 1
fi

# 8. Süsteemi praegune kellaaeg
praegune_aeg=$(date "+%H:%M")

echo ""
echo "$lahtejaam → $sihtjaam"
echo "Praegune kellaaeg: $praegune_aeg"
echo ""
echo "Väljumised:"
echo ""

# 9. & 10. Väljumiste töötlemine ilma tsükliteta
# Eraldame leitud kellaajad eraldi muutujatesse
aeg1=$(echo "$ajad" | sed -n '1p')
aeg2=$(echo "$ajad" | sed -n '2p')
aeg3=$(echo "$ajad" | sed -n '3p')
aeg4=$(echo "$ajad" | sed -n '4p')
aeg5=$(echo "$ajad" | sed -n '5p')
aeg6=$(echo "$ajad" | sed -n '6p')

# 1. väljumine
if [ -n "$aeg1" ]; then
    if [[ "$aeg1" < "$praegune_aeg" ]]; then
        echo -e "${RED}$aeg1  rong on juba väljunud${NC}"
    else
        echo -e "${GREEN}$aeg1  rong on veel ees${NC}"
    fi
fi

# 2. väljumine
if [ -n "$aeg2" ]; then
    if [[ "$aeg2" < "$praegune_aeg" ]]; then
        echo -e "${RED}$aeg2  rong on juba väljunud${NC}"
    else
        echo -e "${GREEN}$aeg2  rong on veel ees${NC}"
    fi
fi

# 3. väljumine
if [ -n "$aeg3" ]; then
    if [[ "$aeg3" < "$praegune_aeg" ]]; then
        echo -e "${RED}$aeg3  rong on juba väljunud${NC}"
    else
        echo -e "${GREEN}$aeg3  rong on veel ees${NC}"
    fi
fi

# 4. väljumine
if [ -n "$aeg4" ]; then
    if [[ "$aeg4" < "$praegune_aeg" ]]; then
        echo -e "${RED}$aeg4  rong on juba väljunud${NC}"
    else
        echo -e "${GREEN}$aeg4  rong on veel ees${NC}"
    fi
fi

# 5. väljumine
if [ -n "$aeg5" ]; then
    if [[ "$aeg5" < "$praegune_aeg" ]]; then
        echo -e "${RED}$aeg5  rong on juba väljunud${NC}"
    else
        echo -e "${GREEN}$aeg5  rong on veel ees${NC}"
    fi
fi

# 6. väljumine
if [ -n "$aeg6" ]; then
    if [[ "$aeg6" < "$praegune_aeg" ]]; then
        echo -e "${RED}$aeg6  rong on juba väljunud${NC}"
    else
        echo -e "${GREEN}$aeg6  rong on veel ees${NC}"
    fi
fi
