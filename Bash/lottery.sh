#!/bin/bash

source ./files.sh
source ./input.sh
source ./lottery_functions.sh
source ./result.sh

clear_files
read_player
read_player_numbers
show_player_numbers
generate_lottery_numbers
show_lottery_numbers
check_matches
show_result
save_result
