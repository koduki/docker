koduki's Dockerfile
=======================

my base docker image.

How to
-----------------------

### make image

``
docker build -t koduki/base .
docker images
``

### run image

``
docker run -i -t koduki/base /bin/bash
``

### ssh

``
# raw command
ssh docker@192.168.59.103 -p 49153 -o "StrictHostKeyChecking no"

# wrapper command
alias ssh-docker=../../scripts/ssh-docker.sh
ssh-docker mng
``

### clean containers
``
../../scripts/clean-containers.sh
``
