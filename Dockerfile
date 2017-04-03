FROM alpine:edge
MAINTAINER Johannes Tegnér <johannes@jitesoft.com>

RUN echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
    && apk upgrade --update \
    && apk add --no-cache mongodb \
    && mkdir /data && mkdir /data/db

VOLUME /data/db
EXPOSE 27017
ENTRYPOINT [ "mongod" ]
