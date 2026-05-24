#!/bin/bash
# Run inside Kali container: bash kali-setup.sh

set -e

echo "=== Kali Setup ==="

# Install Qwen Code
echo "[1/2] Installing Qwen Code..."
apt-get update -qq
bash -c "$(curl -fsSL https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install-qwen.sh)" -s --source qwenchat

# Copy config
echo "[2/2] Configuring Qwen Code..."
mkdir -p ~/.qwen
cp /workshop/config/qwen.json ~/.qwen/config.json

echo ""
echo "=== Done ==="
echo "⚠️  ใส่ API Key ก่อนใช้งาน:"
echo "    nano ~/.qwen/config.json"
echo "    แทน YOUR_DASHSCOPE_API_KEY ด้วย key ที่ได้รับจาก instructor"
echo ""
qwen --version
