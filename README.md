Dockerfile
================================

### boot2docker

```bash
$ boot2docker
$ docker up
```

### build.

```bash
$ docker build -t koduki/centos  
```

### run image and ssh.

```bash
$ docker run -d -p 22 koduki/centos 
$ docker ps|grep '>'   
8cd4034df34d        koduki/centos:latest   /usr/sbin/sshd -D   16 minutes ago      Up 16 minutes       0.0.0.0:49154->22/tcp   hungry_heisenberg
14a346ef3b48        koduki/minion:latest   /usr/sbin/sshd -D   About an hour ago   Up About an hour    0.0.0.0:49153->22/tcp   cocky_babbage

$ sh docker@0.0.0.0 -p 49154
```
