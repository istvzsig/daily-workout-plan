#!/bin/bash

# Cleanup function to stop the server
cleanup() {
    echo "Stopping servers..."
    pkill -f "php -S $SERVER_ADDRESS:$SERVER_PORT"

    # Check if the pkill command was successful
    if [ $? -eq 0 ]; then
        echo "Servers stopped successfully."
    else
        echo "No servers were running on $SERVER_ADDRESS:$SERVER_PORT."
    fi
}