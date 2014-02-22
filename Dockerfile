FROM centos

RUN yum install -y passwd
RUN yum install -y openssh
RUN yum install -y openssh-server
RUN yum install -y openssh-clients
RUN yum install -y sudo
RUN yum install -y rsync

## create user
RUN useradd docker
RUN passwd -f -u docker
RUN mkdir -p /home/docker/.ssh; chown docker /home/docker/.ssh; chmod 700 /home/docker/.ssh
ADD ./authorized_keys /home/docker/.ssh/authorized_keys
RUN chown docker /home/docker/.ssh/authorized_keys; chmod 600 /home/docker/.ssh/authorized_keys

## setup sudoers
RUN echo "docker    ALL=(ALL)       ALL" >> /etc/sudoers.d/docker

## setup sshd and generate ssh-keys by init script
ADD ./sshd_config /etc/ssh/sshd_config
RUN /etc/init.d/sshd start
RUN /etc/init.d/sshd stop

## Seems we cannnot fix public port number
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
