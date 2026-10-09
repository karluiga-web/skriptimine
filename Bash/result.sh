check_matches() {
    matches=0
    for p_num in "${player_numbers[@]}"; do
        echo "Kontrollin numbrit $p_num..."
        local is_hit=0
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
}

show_result() {
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
}

save_result() {
    local current_date=$(date)

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
}
