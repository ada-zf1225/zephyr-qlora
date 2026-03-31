source activate align
#!/bin/bash
set -e
echo "=== Stage 1: SFT on UltraChat-200k ==="
echo "Expected time: 3-5 hours on RTX 4090"
echo ""

ACCELERATE_LOG_LEVEL=info accelerate launch \
    --config_file recipes/accelerate_configs/ddp.yaml \
    --num_processes=1 \
    scripts/sft.py \
    --config recipes/zephyr-7b-beta/sft/config_qlora.yaml \
    --load_in_4bit=true \
    --push_to_hub=false \
    --output_dir=/workspace/alignment-handbook/results/sft

echo ""
echo "=== SFT Complete! ==="
echo "Checkpoint saved to: results/sft/"
