#!/bin/bash
set -e

echo "[*] Update package list..."
apt update -y

echo "[*] Install dependencies (nano, python, pip, mosquitto-clients)..."
apt install -y nano python3 python3-pip mosquitto-clients

echo "[*] Install Python MQTT library..."
pip3 install paho-mqtt

echo "[*] Installation finished."
echo "------------------------------------"
echo "✅ Kali siap dipakai untuk MQTT Pub/Sub + nano editor"
