#!/bin/bash

NAME=$1
IP=192.168.59.103
PORT=`docker port "${NAME}" 22|cut -d: -f2,2` 


ssh docker@${IP} -p ${PORT} -o "StrictHostKeyChecking no"
