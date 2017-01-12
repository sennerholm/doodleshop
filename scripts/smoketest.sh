#!/bin/bash

INSTANCE=$DOODLE_ENV
PORT=8080

set -e
if [ -n "${RANCHER_URL}" ]; then
	echo "Smoke on rancher"
	DOODLE_IP=doodlelb.${GO_PIPELINE_NAME}.rancher.internal
else
# Get the IPAdress of the docker instans
DOODLE_IP=`docker inspect doodleshop-${INSTANCE} | grep IPAddress | awk -F'\"' '{print $4}'`
fi

if ! `curl -f http://${DOODLE_IP}:${PORT}/doodles?author=Homer | grep 'Ummmmm' >/dev/null`
then
    echo "Test failed (curl http://${DOODLE_IP}:${PORT}/doodles?author=Homer | grep 'Ummmmm' >/dev/null)"
    exit 1
fi
# More tests here!
exit 0
