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
$ sh docker@0.0.0.0 -p 49154
```
