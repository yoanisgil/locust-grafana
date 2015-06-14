#!/bin/bash 

docker run -d --name influxdb -p 8083:8083 -p 8086:8086 -e "PRE_CREATE_DB=statsd"  tutum/influxdb
docker run -d --name grafana -p 3000:3000 grafana/grafana
docker run -d --name statsd -v $(pwd)/config.js:/statsd/config.js --link influxdb:influxdb -p 8126:8126 -p 8125:8125/tcp -p 8125:8125/udp -e "INFLUXDB_HOST=influxdb" -e "INFLUXDB_DATABASE=statsd" -e "INFLUXDB_USERNAME=root" -e "INFLUXDB_PASSWORD=root" -e "STATSD_DEBUG=true" shakr/statsd-influxdb
