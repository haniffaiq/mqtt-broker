mosquitto_sub -h haniffaiq.com -p 1883 -t "test/topic"

mosquitto_pub -h haniffaiq.com -p 1883 -t "test/topic" -m "Hello from Kali!"

mosquitto_pub -h haniffaiq.com -p 1883 -t "test/topic" -m '{"device_id":"cli-01","temperature":30,"humidity":75,"status":"ok"}'




