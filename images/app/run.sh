#!/bin/bash

NAME="app"
IMAGE="koduki/app"
MOUNT_PROGRAM=" -v /home/core/program:/home/docker/program "
MOUNT_MYSQL=" -v /home/core/host_lib/mysql:/var/lib/mysql "

docker run -d -P $MOUNT_PROGRAM $MOUNT_MYSQL --name $NAME --hostname $NAME $IMAGE
