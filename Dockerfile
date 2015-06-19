FROM python:2.7.10
MAINTAINER "Yoanis Gil <gil.yoanis@gmail.com>"

ADD requirements.txt /

RUN apt-get update && \
    apt-get install -y python-dev && \
    pip install --no-cache-dir -r requirements.txt && \
    apt-get autoremove -y python-dev && \
    rm -rf /var/lib/apt/lists/*

ADD . /src/app

EXPOSE 5000

WORKDIR /src/app

ENTRYPOINT ["/src/app/start.sh"]
