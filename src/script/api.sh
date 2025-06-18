# https://rapidapi.com/nabeeldev1340/api/workout-planner1
# https://freewebapi.com/health-and-fitness-apis/workout-api/#implementing-the-free-workout-api

function fetch_workout_plan() {
  curl -s -X POST "$RAPID_API_URL" \
    -H "Content-Type: application/json" \
    -H "x-rapidapi-host: $X_RAPID_API_HOST" \
    -H "x-rapidapi-key: $X_RAPID_API_KEY" \
    -d '{"goal":"Build muscle","fitness_level":"Intermediate","preferences":["Weight training","Cardio"],"health_conditions":["None"],"schedule":{"days_per_week":4,"session_duration":60},"plan_duration_weeks":4,"lang":"en"}'
}
