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
docker rm -f test4; docker run -d -P --name test4 koduki/centos
``

### ssh

``
ssh docker@192.168.59.103 -p 49153 -o "StrictHostKeyChecking no"
``
