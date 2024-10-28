#!/bin/bash

SERVER_ADDRESS="localhost"
SERVER_PORT="5555"
BACKEND_ROOT="src/backend/"
JSON_FILE="data/workout_plan.json"
PHP_FILE="src/backend/index.php"

source ./src/script/check_php.sh
source ./src/script/create_json.sh
source ./src/script/create_php.sh
source ./src/script/cleanup.sh

create_workout_plan $PHP_FILE

echo "Starting server on $SERVER_ADDRESS:$SERVER_PORT..."
php -S $SERVER_ADDRESS:$SERVER_PORT -t $BACKEND_ROOT &

sleep 2

# open "http://$SERVER_ADDRESS:$SERVER_PORT"

wait $!
