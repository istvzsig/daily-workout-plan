#!/bin/bash

create_workout_plan() {
  if [ ! -f "$PHP_FILE" ]; then
    echo "Creating $FILENAME file: $PHP_FILE"
    mkdir -p src/backend
    cat <<EOL > "$PHP_FILE"
<?php
\$jsonData = file_get_contents('../../$JSON_FILE');
\$workoutPlan = json_decode(\$jsonData, true);
\$currentDay = date('l'); // 'l' returns the full textual representation of the day (e.g., "Monday")
\$todayWorkout = \$workoutPlan['workout_plan'][\$currentDay] ?? null;
?>
EOL
fi
}