#!/bin/sh

mkdir -p /data/v2ray && unzip -d /data/v2ray $1

docker run \
  --name v2ray \
  -v /data/v2ray:/etc/v2ray \
  -e PATH=/etc/v2ray:$PATH \
  -p 1080:1080 \
  -p 8080:8080 \
  -d alpine:3.10 v2ray -config=/etc/v2ray/config.json
