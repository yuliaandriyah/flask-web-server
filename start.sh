#!/bin/bash
# ============================================================
# start.sh
# Script otomatisasi menjalankan Flask Web Server
# Praktikum Pertemuan 2 - Basic Linux
# ============================================================
set -e
APP_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$APP_DIR"
echo "[INFO] Direktori aplikasi : $APP_DIR"

if [ ! -d "venv" ]; then
echo "[INFO] Virtual environment belum ada, membuat venv..."
python3 -m venv venv
fi
source venv/bin/activate
echo "[INFO] Menginstal dependensi dari requirements.txt..."
pip install --quiet --upgrade pip
#pip install --quiet -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
if [ -f ".env" ]; then
echo "[INFO] Memuat konfigurasi dari file .env"
set -a
source .env
set +a
else
echo "[WARNING] File .env tidak ditemukan, menggunakan nilai default"
fi
echo "[INFO] Menjalankan Flask Web Server pada port 5000..."
exec python server.py
