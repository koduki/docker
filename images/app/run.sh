#!/bin/bash

NAME="app"
IMAGE="koduki/app"
MOUNT_PROGRAM=" -v /home/core/program:/home/docker/program "
MOUNT_MYSQL=" -v /home/core/host_lib/mysql:/var/lib/mysql "

alias ssh-docker=../../scripts/ssh-docker.sh

docker run -d -P $MOUNT_PROGRAM $MOUNT_MYSQL --name $NAME --hostname $NAME $IMAGE
