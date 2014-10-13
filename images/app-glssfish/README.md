koduki's Dockerfile
=======================

glassfish app docker image.

How to
-----------------------

### make image

``
sudo docker build -t koduki/app-glassfish .
sudo docker images
``

### run image

``
docker rm -f app; 
docker run -d -P --name app --hostname app koduki/app
``

### ssh

``
# raw command
ssh docker@localhost -p 49153 -o "StrictHostKeyChecking no"

# wrapper command
alias ssh-docker=../../scripts/ssh-docker.sh
ssh-docker mng
``

### clean containers
``
../../scripts/clean-containers.sh
``
