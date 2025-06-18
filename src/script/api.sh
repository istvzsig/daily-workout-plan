function create_workout_plan_with_ai() {
  local prompt='Create a 4-week intermediate workout plan to build muscle, 4 days per week, 60-minute sessions, using weight training and cardio. Format the result as structured JSON.'

  local response
  response=$(curl -s https://api.openai.com/v1/chat/completions \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -H "Content-Type: application/json" \
    -d '{
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "system", "content": "You are a fitness coach that returns structured JSON workout plans."},
        {"role": "user", "content": "'"${prompt//\"/\\\"}"'"}
      ],
      "temperature": 0.7
    }')

  if ! echo "$response" | jq empty 2>/dev/null; then
    echo "Error: Invalid JSON from OpenAI"
    return 1
  fi

  echo "$response"
}

function get_ai_available_models() {
  curl -s https://api.openai.com/v1/models \
    -H "Authorization: Bearer $OPENAI_API_KEY" | jq
}

function fetch_workout_plan_from_rapid_api() {
  local response
  response=$(curl -s -X POST "$RAPID_API_URL" \
    -H "Content-Type: application/json" \
    -H "x-rapidapi-host: $X_RAPID_API_HOST" \
    -H "x-rapidapi-key: $X_RAPID_API_KEY" \
    -d '{"goal":"Build muscle","fitness_level":"Intermediate","preferences":["Weight training","Cardio"],"health_conditions":["None"],"schedule":{"days_per_week":4,"session_duration":60},"plan_duration_weeks":4,"lang":"en"}')

  if ! echo "$response" | jq . >/dev/null 2>&1; then
    echo "Error: Invalid JSON response"
    return 1
  fi

  echo "$response"
}

# Hugging Face Inference API (may or may not work depending on model availability)
function generate_workout_plan_hf() {
  local hf_api_token="$HUGGING_FACE_TOKEN"
  local model="deepseek-ai/DeepSeek-R1-0528"
  local prompt='Create a 4-week intermediate workout plan to build muscle, 4 days per week, 60-minute sessions, using weight training and cardio. Format the result as JSON.'

  local response=$(curl -s -X POST "https://api-inference.huggingface.co/models/$model" \
    -H "Authorization: Bearer $hf_api_token" \
    -H "Content-Type: application/json" \
    -d "{\"inputs\":\"$prompt\"}")

  echo "$response"
}

function generate_workout_plan_vllm_local() {
  local prompt='Create a 4-week intermediate workout plan to build muscle, 4 days per week, 60-minute sessions, using weight training and cardio. Format the result as structured JSON.'

  local response=$(curl -s -X POST "http://localhost:8000/v1/chat/completions" \
    -H "Content-Type: application/json" \
    -d "$(jq -n --arg p "$prompt" '{
      model: "deepseek-ai/DeepSeek-R1-0528",
      messages: [
        {
          role: "user",
          content: $p
        }
      ]
    }')")

  if ! echo "$response" | jq empty 2>/dev/null; then
    echo "Error: Invalid JSON from vLLM local server"
    return 1
  fi

  echo "$response"
}
