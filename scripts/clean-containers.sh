#!/bin/bash
for id in $(docker ps -a | grep Exit | cut -d " " -f 1); do docker rm $id; done
