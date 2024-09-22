<?php
// Load the JSON data
$jsonData = file_get_contents('../../data/data.json');
$workoutPlan = json_decode($jsonData, true);

// Get the current day of the week
$currentDay = date('l'); // 'l' returns the full textual representation of the day (e.g., "Monday")

// Get the workout plan for the current day
$todayWorkout = $workoutPlan['workout_plan'][$currentDay] ?? null;
?>
