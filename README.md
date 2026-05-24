# AI Automation DevSecOps Workshop — Batch 2

**NSTDA | 25 พฤษภาคม 2026**

โจมตีและป้องกัน AI Agent ด้วย OWASP Top 10 for LLMs

---

## เริ่มต้นใช้งาน

```powershell
git clone https://github.com/MegaWiz-Dev-Team/ai-devsecops-b2.git
cd ai-devsecops-b2
```

---

## ขั้นตอน Setup

### 1. รัน Setup Script (Windows PowerShell — Run as Administrator)

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
.\setup.ps1
```

Script จะ:
- Deploy LLMGoat (target app)
- สร้าง Kali attacker container
- ติดตั้ง Qwen Code ใน Kali
- ตั้งค่า config อัตโนมัติ

### 2. ตรวจสอบผล

```powershell
docker ps
# ต้องเห็น: llmgoat-cpu และ attacker_kali  STATUS: Up
```

เปิด browser → http://localhost:5001 ต้องเห็น 🐐 Billy the Goat

---

## เครื่องมือที่ใช้ใน Workshop

| เครื่องมือ | บทบาท | Link |
|-----------|-------|------|
| LLMGoat | Vulnerable AI app (target) | http://localhost:5001 |
| Ollama | Local LLM runtime | http://localhost:11434 |
| Qwen Code | AI coding agent (attacker/defender) | https://qwen.ai/qwen-code |
| Kali Linux | Attacker container | Docker |
| Wazuh | SIEM / Security monitoring | https://cloud.wazuh.com |

---

## Student Portal

https://hero.megawiz.co.th/?batch=AIDevSecOps02

---

## Slides

https://hero.megawiz.co.th/slides-b2

---

## ติดต่อ Instructor

LINE: **paripolt** | Email: **paripol@megawiz.co**
