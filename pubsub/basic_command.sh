mosquitto_sub -h haniffaiq.com -p 1883 -t "test/topic"

mosquitto_pub -h haniffaiq.com -p 1883 -t "test/topic" -m "Hello from Kali!"

mosquitto_pub -h haniffaiq.com -p 1883 -t "test/topic" -m '{"device_id":"cli-01","temperature":30,"humidity":75,"status":"ok"}'



#WITH PASSWORD 


mosquitto_sub -h haniffaiq.com -p 1883 -t "test/topic" -u hanif -P "Hanif123"

mosquitto_pub -h haniffaiq.com -p 1883 -t "test/topic" -m "Hello from Kali!" -u hanif -P "Hanif123"

mosquitto_pub -h haniffaiq.com -p 1883 -t "test/topic" -m '{"device_id":"cli-01","temperature":30,"humidity":75,"status":"ok"}' -u hanif -P "Hanif123"




