#!/bin/bash


docker rm -f locust 
docker run -p 8089:8089 -v $(pwd)/locustfile.py:/src/app/locustfile.py -d --name locust --env-file=config.env locust  -f /src/app/locustfile.py --host=$1
