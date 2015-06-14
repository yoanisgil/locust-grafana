#!/bin/bash

docker stop grafana statsd influxdb
docker rm grafana statsd influxdb
