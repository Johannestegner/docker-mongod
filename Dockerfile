FROM alpine:edge
MAINTAINER Johannes Tegnér <johannes@jitesoft.com>

RUN echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
    && apk upgrade --update \
    && apk add --no-cache mongodb \
    && mkdir /data && mkdir /data/db \
	&& mkdir /config
	
COPY ./mongod.conf /config/mongod.conf
	
VOLUME /data/db
VOLUME /config

EXPOSE 27017
ENTRYPOINT [ "mongod", "-f", "/config/mongod.conf" ]
