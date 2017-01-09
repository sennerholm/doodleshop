#!/bin/bash
VERSION=${GO_PIPELINE_LABEL}
#Assume 
#DOCKER_USER
#DOCKER_PASSWORD
set -e
docker pull maven:3-jdk-8
docker run --rm --name build-doodleshop -v "$PWD":/usr/src/mymaven \
  -w /usr/src/mymaven maven:3-jdk-8 mvn versions:set \
  -DnewVersion=${VERSION} -B
docker run --rm --name build-doodleshop -v "$PWD":/usr/src/mymaven \
  -w /usr/src/mymaven maven:3-jdk-8 mvn clean package

docker build --tag=${DOCKER_USER}/doodleshop:${VERSION} .
docker login -u ${DOCKER_USER} -p $DOCKER_PASSWORD
docker push ${DOCKER_USER}/doodleshop:${VERSION}