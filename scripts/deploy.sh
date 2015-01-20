#!/bin/bash
INSTANCE=${DOODLE_ENV}
VERSION=${GO_PIPELINE_LABEL}
PORT_PREFIX=$1
set -ex 
sudo docker rm -f doodleshop-${INSTANCE}
sudo docker run -d --name doodleshop-${INSTANCE} doodleshop:$VERSION

