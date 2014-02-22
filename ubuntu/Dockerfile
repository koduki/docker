FROM ubuntu

# set locale
run locale-gen en_US.UTF-8
run update-locale LANG=en_US.UTF-8
env DEBIAN_FRONTEND noninteractive
env LC_ALL C
env LC_ALL en_US.UTF-8

RUN echo "deb http://us.archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update 
RUN apt-get install -y openssh-server
RUN apt-get install -y redis-server --no-install-recommends
RUN apt-get upgrade -y && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* 

## create user
RUN useradd docker -s /bin/bash
#RUN passwd -f -u docker
RUN mkdir -p /home/docker/.ssh; chown docker /home/docker/.ssh; chmod 700 /home/docker/.ssh
ADD ./authorized_keys /home/docker/.ssh/authorized_keys
RUN chown docker /home/docker/.ssh/authorized_keys; chmod 600 /home/docker/.ssh/authorized_keys

## setup sudoers
RUN echo "docker    ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers.d/docker
RUN chmod 440 /etc/sudoers.d/docker

## setup sshd and generate ssh-keys by init script
#ADD ./sshd_config /etc/ssh/sshd_config
RUN mkdir /var/run/sshd

## Seems we cannnot fix public port number
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
