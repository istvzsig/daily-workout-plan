<?php
$jsonData = file_get_contents('../../data/workout_plan.json');
$workoutPlan = json_decode($jsonData, true);
$currentDay = date('l'); // 'l' returns the full textual representation of the day (e.g., "Monday")
$todayWorkout = $workoutPlan['workout_plan'][$currentDay] ?? null;
require_once("../frontend/index.html");

?>
<link rel="stylesheet" href="styles.css" />
