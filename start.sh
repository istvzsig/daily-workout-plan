#!/bin/bash

# Variables for server address and port
SERVER_ADDRESS="localhost"
SERVER_PORT="8001"  # Change this to an unused port

# Function to clean up and stop servers
cleanup() {
    echo "Stopping servers..."
    pkill -f "php -S $SERVER_ADDRESS:$SERVER_PORT"
    exit 1
}

# Trap errors and call cleanup function
trap cleanup ERR

# Check if PHP is installed
source ./src/check_php.sh

# Create a sample JSON file if it doesn't exist
source ./src/create_json.sh

# Create the workout.php file if it doesn't exist
source ./src/create_php.sh

# Start the PHP built-in server in the background
echo "Starting PHP built-in server on http://$SERVER_ADDRESS:$SERVER_PORT"
php -S $SERVER_ADDRESS:$SERVER_PORT &

# Wait for the PHP server to start
sleep 2

# Open the PHP server URL in the default web browser
open "http://$SERVER_ADDRESS:$SERVER_PORT"
