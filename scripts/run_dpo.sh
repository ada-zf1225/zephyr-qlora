#!/bin/bash
set -e
source activate align
echo "=== Stage 2: DPO on UltraFeedback ==="
ACCELERATE_LOG_LEVEL=info accelerate launch \
    --config_file recipes/accelerate_configs/ddp.yaml \
    --num_processes=1 \
    scripts/dpo.py \
    --config recipes/zephyr-7b-beta/dpo/config_qlora.yaml \
    --model_name_or_path=./results/sft \
    --push_to_hub=false \
    --output_dir=./results/dpo
echo "=== DPO Complete ==="
