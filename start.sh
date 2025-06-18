#!/bin/bash

set -euo pipefail

source .env
source ./config.sh
source ./src/script/*.sh

fetch_workout_plan | jq >$JSON_FILE
exit

# get_workout_plans $JSON_FILE
# create_php $PHP_FILE

# echo "###############################"
# echo "Want to open in browser? [y/n]"
# echo "###############################"
# read open

# if [ $open == "y" ]; then
#     echo "Starting server on $SERVER_ADDRESS:$SERVER_PORT..."
#     php -S $SERVER_ADDRESS:$SERVER_PORT -t $BACKEND_ROOT &
#     open "http://$SERVER_ADDRESS:$SERVER_PORT"

# fi

echo "finished..."

wait $!
