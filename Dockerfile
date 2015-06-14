FROM ubuntu:14.04
MAINTAINER "Yoanis Gil <gil.yoanis@gmail.com>"

RUN apt-get update && \
    apt-get install -y python-dev python-pip && \
    apt-get clean 

ADD requirements.txt /
RUN pip install -r requirements.txt

ADD . /src/app

EXPOSE 5000

WORKDIR /src/app

ENTRYPOINT ["/src/app/start.sh"]
