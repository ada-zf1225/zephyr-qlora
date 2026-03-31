#!/bin/bash
set -e

echo "========================================"
echo "  Zephyr-7B QLoRA Full Pipeline"
echo "  Stage 1: SFT → Stage 2: DPO"
echo "========================================"
echo ""

# Setup（首次跑需要，之后可以注释掉）
bash scripts/remote_setup.sh

echo ""
echo "========================================"
echo "  Stage 1/2: SFT"
echo "========================================"
bash scripts/run_sft.sh

echo ""
echo "========================================"
echo "  Stage 2/2: DPO"
echo "========================================"
bash scripts/run_dpo.sh

echo ""
echo "========================================"
echo "  All done!"
echo "  SFT checkpoint: results/sft/"
echo "  DPO checkpoint: results/dpo/"
echo "========================================"
