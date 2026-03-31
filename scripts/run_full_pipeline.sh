#!/bin/bash
set -e
source activate align
echo "========================================"
echo "  Zephyr-7B QLoRA Full Pipeline"
echo "========================================"
bash scripts/run_sft.sh
bash scripts/run_dpo.sh
echo "========================================"
echo "  All done!"
echo "========================================"
