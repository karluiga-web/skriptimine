generate_lottery_numbers() {
    lottery_numbers=()
    while [ ${#lottery_numbers[@]} -lt 5 ]; do
        local rand_num=$(( RANDOM % 50 + 1 ))

        local already_drawn=0
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
}

show_lottery_numbers() {
    echo "Loositud võidunumbrid:"
    for num in "${lottery_numbers[@]}"; do
        echo "$num"
    done
    echo ""
}
