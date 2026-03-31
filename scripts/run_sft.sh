#!/bin/bash
set -e
source activate align
echo "=== Stage 1: SFT on UltraChat-200k ==="
ACCELERATE_LOG_LEVEL=info accelerate launch \
    --config_file recipes/accelerate_configs/ddp.yaml \
    --num_processes=1 \
    scripts/sft.py \
    --config recipes/zephyr-7b-beta/sft/config_qlora.yaml \
    --load_in_4bit=true \
    --push_to_hub=false \
    --output_dir=./results/sft
echo "=== SFT Complete ==="
