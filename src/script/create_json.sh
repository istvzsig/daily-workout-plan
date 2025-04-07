#!/bin/bash

create_json() {
  local file=$1

  if [ ! -f "$file" ]; then
    echo "Creating sample JSON file: $file"
    mkdir -p data
    cat <<EOL >$file
{
  "workout_plan": {
    "Monday": {
      "Upper Body": [
        {
          "exercise": "Push-ups",
          "sets": 3,
          "reps": "16-30"
        },
        {
          "exercise": "Incline Push-ups",
          "sets": 3,
          "reps": "16-30"
        }
      ]
    },
    "Tuesday": {
      "Lower Body": [
        {
          "exercise": "Squats",
          "sets": 3,
          "reps": "20-30"
        },
        {
          "exercise": "Lunges",
          "sets": 3,
          "reps": "20-24 per leg"
        }
      ]
    },
    "Wednesday": {
      "Core and Cardio": [
        {
          "exercise": "Plank",
          "sets": 3,
          "duration": "1-2 minutes"
        },
        {
          "exercise": "Burpees",
          "sets": 3,
          "reps": "10-20"
        }
      ]
    },
    "Thursday": {
      "Full Body": [
        {
          "exercise": "Jump Squats",
          "sets": 3,
          "reps": "16-24"
        },
        {
          "exercise": "Push-ups",
          "sets": 3,
          "reps": "16-30"
        }
      ]
    },
    "Friday": {
      "Upper Body": [
        {
          "exercise": "Diamond Push-ups",
          "sets": 3,
          "reps": "10-20"
        },
        {
          "exercise": "Chair Dips",
          "sets": 3,
          "reps": "16-30"
        }
      ]
    },
    "Saturday": {
      "Lower Body": [
        {
          "exercise": "Bulgarian Split Squats",
          "sets": 3,
          "reps": "16-20 per leg"
        },
        {
          "exercise": "Wall Sit",
          "sets": 3,
          "duration": "1-2 minutes"
        }
      ]
    },
    "Sunday": {
      "Rest or Active Recovery": [
        {
          "exercise": "Light walking",
          "sets": 1,
          "duration": "1 hour"
        }
      ]
    }
  }
}
EOL
  fi

}
