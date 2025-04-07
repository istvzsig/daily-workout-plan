#!/bin/bash

SERVER_ADDRESS="localhost"
SERVER_PORT="5555"
BACKEND_ROOT="src/backend/"
JSON_FILE="./data/workout_plan.json"
PHP_FILE="src/backend/index.php"

source ./src/script/check_php.sh
source ./src/script/create_json.sh
source ./src/script/create_php.sh
source ./src/script/cleanup.sh

create_json $JSON_FILE
create_php $PHP_FILE

echo "###############################"
echo "Want to open in browser? [y/n]"
echo "###############################"
read open

if [ $open == "y" ]; then
    echo "Starting server on $SERVER_ADDRESS:$SERVER_PORT..."
    php -S $SERVER_ADDRESS:$SERVER_PORT -t $BACKEND_ROOT &
    open "http://$SERVER_ADDRESS:$SERVER_PORT"

fi

echo "finished..."

wait $!
