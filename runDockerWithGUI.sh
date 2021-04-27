#!/bin/bash

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker rm crocdockercontainer
docker run \
--name crocdockercontainer \
-it \
-p 1984:1984 \
-p 7000-8000:7000-8000 \
-v $XSOCK:$XSOCK:rw \
-v $XAUTH:$XAUTH:rw \
-e DISPLAY=$DISPLAY \
-e XAUTHORITY=$XAUTH \
--ipc="host" \
crocdocker:latest