#!/bin/bash
VERSION=${GO_PIPELINE_LABEL}
# Based on: http://blog.terranillius.com/post/docker_builder_pattern/
#Assume 
#DOCKER_USER
#DOCKER_PASSWORD
# Namn från GO_PIPELINE_NAME?
set -e

docker build --build-arg BUILD_VERSION=${VERSION}  \
  --build-arg DOCKER_USER=${DOCKER_USER} \
  -t doodleshop-img -f Dockerfile.build .
docker rm doodleshop-cont || /bin/true
docker create --name doodleshop-cont doodleshop-img
docker cp doodleshop-cont:/build/target/doodleshop.war ./doodleshop.war
#Save stuff for downstream builds in artifacts
mkdir artifacts || /bin/true
docker cp doodleshop-cont:/build/target/classes/BuildInfo.properties \
          artifacts/BuildInfo.properties
docker cp doodleshop-cont:/build/target/generated-cd/rancher \
          artifacts
docker rm doodleshop-cont
docker build --tag=${DOCKER_USER}/doodleshop:${VERSION} .
docker login -u ${DOCKER_USER} -p $DOCKER_PASSWORD
docker push ${DOCKER_USER}/doodleshop:${VERSION}

cp -a scripts tests artifacts

