#!/bin/bash
set -ex 
INSTANCE=${DOODLE_ENV}
VERSION=${GO_PIPELINE_LABEL}
PORT_PREFIX=$1
NAME=$2
sudo docker rm -f doodleshop-${INSTANCE}-${NAME}
sudo docker run -d --name doodleshop-${INSTANCE}-${NAME} doodleshop:$VERSION

