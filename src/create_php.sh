#!/bin/bash

PHP_FILE="src/workout.php"
if [ ! -f "$PHP_FILE" ]; then
    echo "Creating workout.php file: $PHP_FILE"
    mkdir -p src
    cat <<EOL > $PHP_FILE
<?php
// Load the JSON data
$jsonData = file_get_contents('../data/data.json');
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
