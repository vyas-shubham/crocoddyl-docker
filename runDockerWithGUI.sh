#!/bin/bash

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker rm crocdockercontainer
docker run \
--name crocdockercontainer \
-it \
-v $XSOCK:$XSOCK:rw \
-v $XAUTH:$XAUTH:rw \
-e DISPLAY=$DISPLAY \
-e XAUTHORITY=$XAUTH \
--ipc="host" \
crocdocker:latest