#!/bin/bash
set -ex 
INSTANCE=${DOODLE_ENV}
VERSION=${GO_PIPELINE_LABEL}
PORT_PREFIX=$1
NAME=$2
docker rm -f doodleshop-${INSTANCE}-${NAME}
docker run -d --name doodleshop-${INSTANCE}-${NAME} doodleshop:$VERSION

