Dockerfile
================================

### boot2docker

``
$ boot2docker
$ docker up

``

### build.

``
$ docker build -t koduki/centos  
``

### run image and ssh.

``
$ docker run -d -p 22 koduki/centos 
$ docker ps|grep '>'
$ sh docker@0.0.0.0 -p 49154
``
