#!/bin/bash

FILENAME="workout_plan.php"
PHP_FILE="src/backend/$FILENAME"
DATA_JSON="../data/data.json"

create_workout_plan() {
  if [ ! -f "$PHP_FILE" ]; then
    echo "Creating $FILENAME file: $PHP_FILE"
    mkdir -p src/backend
    cat <<EOL > "$PHP_FILE"
<?php
// Load the JSON data
\$jsonData = file_get_contents('$DATA_JSON');
\$workoutPlan = json_decode(\$jsonData, true);

// Get the current day of the week
\$currentDay = date('l'); // 'l' returns the full textual representation of the day (e.g., "Monday")

// Get the workout plan for the current day
\$todayWorkout = \$workoutPlan['workout_plan'][\$currentDay] ?? null;
?>
EOL
fi
}

is_server_running() {
    nc -z $SERVER_ADDRESS $SERVER_PORT
}
