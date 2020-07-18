#!/bin/bash

docker run \
  --name pgdb \
  -p 5432:5432 \
  -e POSTGRES_PASSWORD=postgres \
  -e PGDATA=/var/lib/postgresql/data/pgdata \
  -v /data/postgresql/data:/var/lib/postgresql/data \
  -d postgres:10
