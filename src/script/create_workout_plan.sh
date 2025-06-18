function create_workout_plan_json() {
    local workout_plan="$1"
    if [[ -z $workout_plan ]]; then
        echo "Error: Missing workout_plan argument in function call: create_workout_plan_json"
        exit 1
    fi
    echo "$workout_plan" | jq >"$JSON_FILE"
}
