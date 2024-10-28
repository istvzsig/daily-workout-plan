#!/bin/bash

create_workout_plan() {
  local file=$1
  if [ ! -f "$file" ]; then
    echo "Creating $FILENAME file: $file"
    mkdir -p src/backend
    cat <<EOL >"$file"
<?php
\$jsonData = file_get_contents('$JSON_FILE');
\$workoutPlan = json_decode(\$jsonData, true);
\$currentDay = date('l'); // 'l' returns the full textual representation of the day (e.g., "Monday")
\$todayWorkout = \$workoutPlan['workout_plan'][\$currentDay] ?? null;
require_once("../frontend/index.html")
?>
EOL
  fi
}
