locust.io + grafana
===================

A basic demo showing integration between locustio.io and grafana, with statsd as a metrics collector and InfluxDB as the DB backend.

Setup
===================

Install project dependencies (you should probably use [virtualenv](https://virtualenv.pypa.io/en/latest/):
    
    - pip install -r requirements.txt


I recommend that you install [docker-compose](https://docs.docker.com/compose/) since it will
get you setup in no time. Once docker-compose is installed you can launch the project with:

```
docker-compose run locust --host=http://www.google.com
```

Depending on your hardware resources you might need to fire the command above twice since it takes a while to steup grafana and InfluxDB for the first time. Just hit Ctrl+C and relaunch the command and you should be good to go (I intended to fix this by adding an exponential backoff check on influxdb/grafana endpoints rediability).


And visit the usual locust web interface at http://localhost:8089

Grafana
===================

Grafana is accesible through http://localhost:3000 with user admin and password admin. Once logged in you will find a Locust Dashboard with graphs reporting Average Response Time and number of requests by response code [200, 400, 403, 404, 500, 503].

Locust
===================

Any locust command line argument *should* work with the docker-compose run command so in theory you could use this project to create a master/slave setup. I plan to test this feature whenever I get a chance ;)


