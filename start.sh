#!/bin/bash

# Variables for server address and port
SERVER_ADDRESS="localhost"
SERVER_PORT="8001"  # Change this to an unused port
# SERVER_PORT="8000"  # Original port, commented out

# Function to clean up and stop servers
cleanup() {
    echo "Stopping servers..."
    # Kill the PHP server
    pkill -f "php -S $SERVER_ADDRESS:$SERVER_PORT"
    exit 1
}

# Trap errors and call cleanup function
trap cleanup ERR

# Check if PHP is installed
if ! command -v php &> /dev/null
then
    echo "PHP is not installed. Please install PHP first."
    cleanup
fi

# Create a sample JSON file if it doesn't exist
JSON_FILE="data.json"
if [ ! -f "$JSON_FILE" ]; then
    echo "Creating sample JSON file: $JSON_FILE"
    cat <<EOL > $JSON_FILE
{
  "workout_plan": {
    "Monday": {
      "Upper Body": [
        {
          "exercise": "Push-ups",
          "sets": 3,
          "reps": "8-15"
        },
        {
          "exercise": "Incline Push-ups",
          "sets": 3,
          "reps": "8-15"
        }
      ]
    },
    "Tuesday": {
      "Lower Body": [
        {
          "exercise": "Squats",
          "sets": 3,
          "reps": "10-15"
        },
        {
          "exercise": "Lunges",
          "sets": 3,
          "reps": "10-12 per leg"
        }
      ]
    },
    "Wednesday": {
      "Core and Cardio": [
        {
          "exercise": "Plank",
          "sets": 3,
          "duration": "30-60 seconds"
        },
        {
          "exercise": "Burpees",
          "sets": 3,
          "reps": "5-10"
        }
      ]
    },
    "Thursday": {
      "Full Body": [
        {
          "exercise": "Jump Squats",
          "sets": 3,
          "reps": "8-12"
        },
        {
          "exercise": "Push-ups",
          "sets": 3,
          "reps": "8-15"
        }
      ]
    },
    "Friday": {
      "Upper Body": [
        {
          "exercise": "Diamond Push-ups",
          "sets": 3,
          "reps": "5-10"
        },
        {
          "exercise": "Chair Dips",
          "sets": 3,
          "reps": "8-15"
        }
      ]
    },
    "Saturday": {
      "Lower Body": [
        {
          "exercise": "Bulgarian Split Squats",
          "sets": 3,
          "reps": "8-10 per leg"
        },
        {
          "exercise": "Wall Sit",
          "sets": 3,
          "duration": "30-60 seconds"
        }
      ]
    },
    "Sunday": {
      "Rest or Active Recovery": [
        {
          "exercise": "Light walking",
          "sets": 1,
          "duration": "30 minutes"
        }
      ]
    }
  }
}
EOL
fi

# Create the workout.php file if it doesn't exist
PHP_FILE="workout.php"
if [ ! -f "$PHP_FILE" ]; then
    echo "Creating workout.php file: $PHP_FILE"
    cat <<EOL > $PHP_FILE
<?php
// Load the JSON data
$jsonData = file_get_contents('data.json');
$workoutPlan = json_decode($jsonData, true);

// Get the current day of the week
$currentDay = date('l'); // 'l' returns the full textual representation of the day (e.g., "Monday")

// Get the workout plan for the current day
$todayWorkout = \$workoutPlan['workout_plan'][\$currentDay] ?? null;

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daily Workout Plan</title>
    <link rel="stylesheet" href="styles.css"> <!-- Optional: Link to a CSS file for styling -->
</head>
<body>
    <h1>Workout Plan for <?php echo \$currentDay; ?></h1>

    <?php if (\$todayWorkout): ?>
        <?php foreach (\$todayWorkout as \$workoutType => \$exercises): ?>
            <h2><?php echo \$workoutType; ?></h2>
            <ul>
                <?php foreach (\$exercises as \$exercise): ?>
                    <li>
                        <?php echo \$exercise['exercise']; ?>:
                        <?php echo \$exercise['sets'] . ' sets of ' . (isset(\$exercise['reps']) ? \$exercise['reps'] : \$exercise['duration']); ?>
                    </li>
                <?php endforeach; ?>
            </ul>
        <?php endforeach; ?>
    <?php else: ?>
        <p>No workout plan available for today.</p>
    <?php endif; ?>
</body>
</html>
EOL
fi

# Start the PHP built-in server in the background
echo "Starting PHP built-in server on http://$SERVER_ADDRESS:$SERVER_PORT"
php -S $SERVER_ADDRESS:$SERVER_PORT &

# Wait for the PHP server to start
sleep 2

# Open the PHP server URL in the default web browser
open "http://$SERVER_ADDRESS:$SERVER_PORT"
