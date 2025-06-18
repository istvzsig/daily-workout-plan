function stop_server() {
    echo "Stopping servers..."
    pkill -f "php -S $SERVER_ADDRESS:$SERVER_PORT"

    if [ $? -eq 0 ]; then
        echo "Servers stopped successfully."
    else
        echo "No servers were running on $SERVER_ADDRESS:$SERVER_PORT."
    fi
}
