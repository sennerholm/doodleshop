#!/bin/bash
INSTANCE=${DOODLE_ENV}
VERSION=${GO_PIPELINE_LABEL}
PORT_PREFIX=$1
set -ex 
docker rm -f doodleshop-${INSTANCE} || /bin/true
# Is depending on directory name running docker-compose up in!! Ugly!!
docker run -d --name doodleshop-${INSTANCE} --link dockerapplicationserver_elk_1:elk -p ${PORT_PREFIX}8080:8080 -p ${PORT_PREFIX}9200:9200 doodleshop:$VERSION


