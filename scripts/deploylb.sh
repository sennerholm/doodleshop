#!/bin/bash
set -ex
INSTANCE=${DOODLE_ENV}
VERSION=${GO_PIPELINE_LABEL}
PORT_PREFIX=$1
sudo docker rm -f haproxy-${INSTANCE}
sudo docker run -d --name haproxy-${INSTANCE} -l doodleshop-${INSTANCE}-green:green -l doodleshop-${INSTANCE}-blue:blue -p ${PORT_PREFIX}8080:80 dockerfile/haproxy

