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
docker rm -f app; 
docker run -d -P --name app --hostname app koduki/centos 
``

### ssh

``
# raw command
ssh docker@192.168.59.103 -p 49153 -o "StrictHostKeyChecking no"

# wrapper command
alias ssh-docker=../scripts/ssh-docker.sh
ssh-docker mng
``

### clean containers
``
../scripts/clean-containers.sh
``
