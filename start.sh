#!/bin/bash
set -euo pipefail

mkdir -p "./data"

# Load environment variables
if [ -f .env ]; then
    source .env
fi

# Load config variables
if [ -f ./config.sh ]; then
    source ./config.sh
fi

# Source all scripts in ./src/script/
for script in ./src/script/*.sh; do
    [ -f "$script" ] && source "$script"
done

# Function to start vLLM Docker container if not running
start_vllm_container() {
    local container_name="my_vllm_container"
    if ! docker ps --format '{{.Names}}' | grep -q "^${container_name}$"; then
        echo "Starting vLLM Docker container..."
        docker run --gpus all \
            --name "$container_name" \
            -v ~/.cache/huggingface:/root/.cache/huggingface \
            -e "HUGGING_FACE_HUB_TOKEN=$HUGGING_FACE_TOKEN" \
            -p 8000:8000 \
            --ipc=host \
            -d vllm/vllm-openai:latest \
            --model deepseek-ai/DeepSeek-R1-0528

        echo "Waiting for vLLM server to start..."
        sleep 15 # adjust as needed for model loading time
    else
        echo "vLLM Docker container is already running."
    fi
}

start_vllm_container

# Call the function you want to test:
generate_workout_plan_vllm_local

echo "finished..."
