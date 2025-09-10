# MQTT Broker (Dockerized with Authentication & ACL)

Repository ini berisi setup **MQTT Broker (Eclipse Mosquitto)** yang dijalankan menggunakan Docker Compose.  
Konfigurasi ini sudah mendukung:

- **Username/Password Authentication** (via `passwd` file).
- **Access Control List (ACL)** untuk membatasi akses topic tertentu.
- **Support untuk Anonymous Access** pada topic tertentu (misalnya `public/#`).
- **Port 1883** untuk MQTT TCP, **9001** untuk WebSocket (opsional).

---

## 🔹 Listener Utama (`mosquitto.conf`)
```conf
listener 1883

# Izinkan anonymous (tapi dibatasi lewat ACL)
allow_anonymous true

# File otentikasi user
password_file /mosquitto/config/passwd

# File ACL untuk kontrol akses topic
acl_file /mosquitto/config/acl
```

---

## 🔹 passwd
File ini berisi daftar user & password hash yang dibuat dengan `mosquitto_passwd`.

**Contoh cara membuat user baru:**
```bash
docker run --rm -it   -v $(pwd)/passwd:/mosquitto/config/passwd   eclipse-mosquitto:2   mosquitto_passwd -c /mosquitto/config/passwd hanif
```

**Contoh isi file (`passwd`):**
```
hanif:$7$101$abcdefghijk...
device1:$7$101$zyxwvutsrqpo...
```

---

## 🔹 acl
```conf
# User hanif bisa akses semua topic sensor/hanif/#
user hanif
topic readwrite private/#

# Anonymous boleh akses public topic
pattern readwrite public/#
```

---

## 🚀 Cara Menjalankan

**Clone repository**
```bash
git clone https://github.com/haniffaiq/mqtt-broker.git
cd mqtt-broker
```

**Buat user/password (kalau belum ada)**
```bash
docker run --rm -it   -v $(pwd)/passwd:/mosquitto/config/passwd   eclipse-mosquitto:2   mosquitto_passwd /mosquitto/config/passwd <username>
```

**Jalankan broker**
```bash
docker-compose up -d
```

**Cek log**
```bash
docker logs -f mqtt-broker
```
