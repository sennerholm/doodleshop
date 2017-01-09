#!/bin/bash
VERSION=${GO_PIPELINE_LABEL}
# Based on: http://blog.terranillius.com/post/docker_builder_pattern/
#Assume 
#DOCKER_USER
#DOCKER_PASSWORD
# Namn från GO_PIPELINE_NAME?
set -e

docker build -t doodleshop-img -f Dockerfile.build
docker create --name doodleshop-cont doodleshop-img
docker cp doodleshop-cont:/build/target/mgs.war ./target/doodleshop.war
docker rm doodleshop-cont
docker build --tag=${DOCKER_USER}/doodleshop:${VERSION} .
docker login -u ${DOCKER_USER} -p $DOCKER_PASSWORD
docker push ${DOCKER_USER}/doodleshop:${VERSION}