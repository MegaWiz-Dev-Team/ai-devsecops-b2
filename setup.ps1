# AI DevSecOps Workshop — Batch 2 Setup Script
# Run as Administrator in PowerShell

Write-Host "=== AI DevSecOps Workshop Setup ===" -ForegroundColor Cyan

# 1. Clone and start LLMGoat
Write-Host "`n[1/4] Deploy LLMGoat..." -ForegroundColor Yellow
if (!(Test-Path "LLMGoat")) {
    git clone https://github.com/MegaWiz-Dev-Team/LLMGoat.git
}
Set-Location LLMGoat
docker compose -f compose.local.yaml up -d --build
Set-Location ..

# 2. Start Kali attacker container
Write-Host "`n[2/4] Start Kali container..." -ForegroundColor Yellow
$kaliRunning = docker ps --filter "name=attacker_kali" --format "{{.Names}}"
if (!$kaliRunning) {
    docker run --name attacker_kali -itd `
        --add-host=host.docker.internal:host-gateway `
        kalilinux/kali-rolling
}

# 3. Install Qwen Code inside Kali
Write-Host "`n[3/4] Install Qwen Code in Kali..." -ForegroundColor Yellow
docker exec attacker_kali bash -c "apt-get update -qq && bash -c `"`$(curl -fsSL https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install-qwen.sh)`" -s --source qwenchat"

# 4. Copy Qwen Code config into Kali
Write-Host "`n[4/4] Configure Qwen Code..." -ForegroundColor Yellow
docker exec attacker_kali bash -c "mkdir -p ~/.qwen"
$configContent = Get-Content -Raw "config\qwen.json"
docker exec -i attacker_kali bash -c "cat > ~/.qwen/config.json" <<< $configContent

Write-Host "`n=== Setup Complete ===" -ForegroundColor Green
Write-Host "LLMGoat  : http://localhost:5001" -ForegroundColor Cyan
Write-Host "Kali     : docker exec -it attacker_kali /bin/bash" -ForegroundColor Cyan
Write-Host "Slides   : https://hero.megawiz.co.th/slides-b2" -ForegroundColor Cyan
