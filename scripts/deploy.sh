#!/bin/bash
INSTANCE=${DOODLE_ENV}
VERSION=${GO_PIPELINE_LABEL}
PORT_PREFIX=$1
set -ex 
sudo docker rm -f doodleshop-${INSTANCE}
sudo docker run -d --name doodleshop-${INSTANCE} -p ${PORT_PREFIX}8080:8080 -p ${PORT_PREFIX}9200:9200 doodleshop:$VERSION


