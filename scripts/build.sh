#!/bin/bash
VERSION=${GO_PIPELINE_LABEL}
docker run 
docker run -it --rm --name build-doodleshop -v "$PWD":/usr/src/mymaven \
  -w /usr/src/mymaven maven:3-jdk-8 mvn versions:set \
  -DnewVersion=${env.GO_PIPELINE_LABEL} -B
docker run -it --rm --name build-doodleshop -v "$PWD":/usr/src/mymaven \
  -w /usr/src/mymaven maven:3-jdk-8 mvn clean package
docker build --tag=doodleshop:${GO_PIPELINE_LABEL} .