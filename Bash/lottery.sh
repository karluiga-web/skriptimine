#!/bin/bash

> player_numbers.txt
> lottery_numbers.txt

read -p "Sisesta mängija nimi: " player_name
if [ -z "$player_name" ]; then
    player_name="Unknown"
fi

player_numbers=()
echo "Palun sisesta 5 erinevat numbrit vahemikus 1–50:"

while [ ${#player_numbers[@]} -lt 5 ]; do
    read -p "Sisesta $(( ${#player_numbers[@]} + 1 )). number: " input_num

    if [ -z "$input_num" ]; then
        echo "Viga: Sisend ei tohi olla tühi!"
        continue
    fi

    if ! [[ "$input_num" =~ ^[0-9]+$ ]]; then
        echo "Viga: Sisestatud väärtus peab olema täisarv!"
        continue
    fi

    if [ "$input_num" -lt 1 ] || [ "$input_num" -gt 50 ]; then
        echo "Viga: Number peab olema vahemikus 1–50!"
        continue
    fi

    already_chosen=0
    for num in "${player_numbers[@]}"; do
        if [ "$num" -eq "$input_num" ]; then
            already_chosen=1
            break
        fi
    done

    if [ "$already_chosen" -eq 1 ]; then
        echo "Viga: Sama numbrit on juba varem valitud!"
        continue
    fi

    player_numbers+=("$input_num")
    echo "$input_num" >> player_numbers.txt
done

echo ""
echo "Sinu valitud numbrid:"
for num in "${player_numbers[@]}"; do
    echo "$num"
done
echo ""

lottery_numbers=()
while [ ${#lottery_numbers[@]} -lt 5 ]; do
    rand_num=$(( RANDOM % 50 + 1 ))

    already_drawn=0
    for num in "${lottery_numbers[@]}"; do
        if [ "$num" -eq "$rand_num" ]; then
            already_drawn=1
            break
        fi
    done

    if [ "$already_drawn" -eq 0 ]; then
        lottery_numbers+=("$rand_num")
        echo "$rand_num" >> lottery_numbers.txt
    fi
done

echo "Loositud võidunumbrid:"
for num in "${lottery_numbers[@]}"; do
    echo "$num"
done
echo ""

matches=0
for p_num in "${player_numbers[@]}"; do
    echo "Kontrollin numbrit $p_num..."
    is_hit=0
    for l_num in "${lottery_numbers[@]}"; do
        if [ "$p_num" -eq "$l_num" ]; then
            is_hit=1
            break
        fi
    done

    if [ "$is_hit" -eq 1 ]; then
        echo "TABAMUS!"
        ((matches++))
    else
        echo "Ei tabanud."
    fi
    echo ""
done

echo "Mängija: $player_name"
echo "Tabamusi: $matches / 5"

case $matches in
    5) result_text="JACKPOT!" ;;
    4) result_text="Väga hea tulemus!" ;;
    3) result_text="Hea tulemus." ;;
    2) result_text="Kaks tabamust." ;;
    1) result_text="Üks tabamus." ;;
    0) result_text="Seekord tabamusi ei olnud." ;;
esac

echo "Hinnang: $result_text"

current_date=$(date)

{
    echo "========================================"
    echo "Date: $current_date"
    echo "Player: $player_name"
    echo "Player numbers:"
    for num in "${player_numbers[@]}"; do
        echo "$num"
    done
    echo "Lottery numbers:"
    for num in "${lottery_numbers[@]}"; do
        echo "$num"
    done
    echo "Matches: $matches"
    echo "Result: $result_text"
} >> results.txt
