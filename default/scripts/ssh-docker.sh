#!/bin/bash

NAME=$1
IP=localhost
PORT=`docker port "${NAME}" 22|cut -d: -f2,2` 

ssh docker@${IP} -p ${PORT} -o "StrictHostKeyChecking no"
