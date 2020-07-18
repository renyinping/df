#!/bin/bash

docker run \
  --name="cf" \
  -p 8090:8090 \
  -p 8091:8091 \
  --link pgdb:db \
  --user root:root \
  -v /data/confluence:/var/atlassian/application-data/confluence \
  -d atlassian/confluence-server:7.6.0

sleep 30

docker cp atlassian-extras-decoder-v2-3.4.1.jar cf:/opt/atlassian/confluence/confluence/WEB-INF/lib/atlassian-extras-decoder-v2-3.4.1.jar

sleep 30

docker restart cf
