#!/bin/bash

JSON_FILE="data/data.json"

if [ ! -f "$JSON_FILE" ]; then
    echo "Creating sample JSON file: $JSON_FILE"
    mkdir -p data
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
