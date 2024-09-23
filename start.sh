#!/bin/bash

SERVER_ADDRESS="localhost"
SERVER_PORT="5555"
BACKEND_ROOT="./src/backend/"

source ./src/script/check_php.sh
source ./src/script/create_json.sh
source ./src/script/create_php.sh
source ./src/script/cleanup.sh

# TODO: Add environment check for local server
is_server_running
create_workout_plan

echo "Starting server on $SERVER_ADDRESS:$SERVER_PORT..."
php -S $SERVER_ADDRESS:$SERVER_PORT -t $BACKEND_ROOT &

sleep 2

open "http://$SERVER_ADDRESS:$SERVER_PORT/index.php"

wait $!

if is_server_running; then
    echo "Server was running. Running cleanup..."
    cleanup
else
    echo "Server was not running. No cleanup needed."
fi
