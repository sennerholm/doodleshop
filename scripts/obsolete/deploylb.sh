#!/bin/bash
set -ex
INSTANCE=${DOODLE_ENV}
VERSION=${GO_PIPELINE_LABEL}
PORT_PREFIX=$1
GW=`route | grep default | awk '{print $2}'`
docker rm -f haproxy-${INSTANCE} || /bin/true
docker run -d -v /vagrant/haproxy:/haproxy-override --name haproxy-${INSTANCE} --add-host gw:${GW} -p ${PORT_PREFIX}8080:80 dockerfile/haproxy

