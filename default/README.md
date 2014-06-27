koduki's Dockerfile
=======================

my standard docker image.

How to
-----------------------

### make image

``
docker build -t koduki/centos .
docker images
``

### run image

``
docker rm -f test4; 
docker run -d -P --name mng --hostname mng koduki/centos 
``

### ssh

``
# raw command
ssh docker@192.168.59.103 -p 49153 -o "StrictHostKeyChecking no"

# wrapper command
alias ssh-docker=./scripts/ssh-docker.sh
ssh-docker mng
``

### clean containers
``
for id in $(docker ps -a | grep Exit | cut -d " " -f 1); do docker rm $id; done
``
