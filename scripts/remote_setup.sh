#!/bin/bash
set -e
echo "=== Installing alignment-handbook ==="
pip install . -q
pip install flash-attn --no-build-isolation -q

echo "=== Logging into HuggingFace ==="
# 用环境变量里的 token 登录
if [ -n "$HF_TOKEN" ]; then
    huggingface-cli login --token $HF_TOKEN
    echo "✓ HuggingFace login successful"
else
    echo "⚠ HF_TOKEN not set, skipping login"
fi

echo "=== Setup complete ==="
