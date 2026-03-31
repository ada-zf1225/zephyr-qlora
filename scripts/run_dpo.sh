#!/bin/bash
set -e
echo "=== Stage 2: DPO on UltraFeedback ==="
echo "Expected time: 2-3 hours on RTX 4090"
echo ""

ACCELERATE_LOG_LEVEL=info accelerate launch \
    --config_file recipes/accelerate_configs/ddp.yaml \
    --num_processes=1 \
    scripts/dpo.py \
    --config recipes/zephyr-7b-beta/dpo/config_qlora.yaml \
    --model_name_or_path=/workspace/alignment-handbook/results/sft \
    --push_to_hub=false \
    --output_dir=/workspace/alignment-handbook/results/dpo

echo ""
echo "=== DPO Complete! ==="
echo "Final model saved to: results/dpo/"
