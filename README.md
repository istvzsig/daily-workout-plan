# PHP Built-in Server Setup Script 🚀

This Bash script sets up and runs a PHP built-in server for a backend application. It checks for necessary files, starts the server, and performs cleanup after the server stops. The server handles backend PHP operations, including data retrieval and processing. 💻🔍

## Overview

- **Purpose**: Initialize a PHP server for local development. 🛠️
- **Environment**: Assumes PHP is installed on your machine. 🖥️

## Script Details

### Variables

- `SERVER_ADDRESS`: The address where the server will run (default is `localhost`). 🌐
- `SERVER_PORT`: The port number for the server (default is `5555`). 🔌
- `BACKEND_ROOT`: The root directory for the backend files (set to `./src/backend/`). 📁

### Functionality

1. **Check PHP Installation**: Verifies if PHP is installed by sourcing `check_php.sh`. ✅
2. **File Creation**:
   - Creates a sample JSON file if it doesn't exist (`create_json.sh`). 📄
   - Creates the `workout_plan.php` file if it doesn't exist (`create_php.sh`). 📝
3. **Server Check**: Checks if the server is already running (functionality to be implemented). ⚠️
4. **Start the Server**:
   - Starts the PHP built-in server in the background. 🚀
   - Waits for 2 seconds to allow the server to start. ⏳
5. **Open Browser**: Opens the default web browser to the server's index file (`index.php`). 🌍
6. **Wait for Server Process**: Waits for the server process to finish. ⏲️
7. **Cleanup**: Checks if the server was running and performs cleanup if necessary. 🧹

## Work in Progress

- The server check functionality is marked as a TODO and needs to be implemented. 🛠️
- Additional error handling and logging features may be added in future updates. 📈
- Consideration for production deployment and security measures is needed. 🔒

## Usage

1. Ensure PHP is installed on your machine. 📦
2. Place the script in a directory with the necessary backend files. 📂
3. Run the script from the terminal. 🖥️

## Notes

- The script relies on external scripts for checking PHP, creating JSON, and creating PHP files. Ensure these scripts are present and executable. 📜
- The cleanup function should handle any necessary cleanup tasks, such as removing temporary files or stopping services. 🗑️
- This script is designed for local development and may need modifications for production use. ⚙️
- The server handles backend PHP operations, including data retrieval and processing. 🔄

---

Feel free to explore the depths of shell scripting and ethical hacking as you enhance your backend development skills! 🕵️‍♂️💡
