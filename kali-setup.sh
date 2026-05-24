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

echo "=== Done ==="
echo "Test: qwen --version"
qwen --version
