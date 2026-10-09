read_player() {
    read -p "Sisesta mängija nimi: " player_name
    if [ -z "$player_name" ]; then
        player_name="Unknown"
    fi
}

read_player_numbers() {
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

        local already_chosen=0
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
}

show_player_numbers() {
    echo ""
    echo "Sinu valitud numbrid:"
    for num in "${player_numbers[@]}"; do
        echo "$num"
    done
    echo ""
}
