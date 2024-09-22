#!/bin/bash

# Variables for server address and port
SERVER_ADDRESS="localhost"
SERVER_PORT="5555"
BACKEND_ROOT="./src/backend/"  # Set the document root to the backend directory

# Check if PHP is installed
source ./src/script/check_php.sh
# Create a sample JSON file if it doesn't exist
source ./src/script/create_json.sh
# Create the workout_plan.php file if it doesn't exist
source ./src/script/create_php.sh
# Import cleanup function
source ./src/script/cleanup.sh

# Check if server is running
# TODO: Add environment check for local server
is_server_running

# Create the workout_plan.php file
create_workout_plan

# Start the PHP built-in server in the background
echo "Starting server on $SERVER_ADDRESS:$SERVER_PORT..."
php -S $SERVER_ADDRESS:$SERVER_PORT -t $BACKEND_ROOT &

# Wait for the PHP server to start
sleep 2

# Open the PHP server URL in the default web browser
open "http://$SERVER_ADDRESS:$SERVER_PORT/index.php"  # Open the index.php file in the backend directory

# Wait for the server process to finish
wait $!

# Check if the server was running before cleanup
if is_server_running; then
    echo "Server was running. Running cleanup..."
    cleanup
else
    echo "Server was not running. No cleanup needed."
fi
