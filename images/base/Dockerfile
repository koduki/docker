FROM centos:centos7
MAINTAINER koduki

#
# set repositories
#
RUN yum install -y epel-release
RUN yum update -y

#
# Install default packages
#
RUN yum --enablerepo=remi,epel install -y \
  sudo\
  passwd\
  openssh\
  openssh-server\
  openssh-clients\
  openssh-server-sysvinit\
  syslog\
  wget\
  rsync\
  unzip\
  nkf\
  tar

#
# Dev Tools
#
#RUN yum --enablerepo=remi,epel groupinstall -y "Development tools"
#RUN yum --enablerepo=remi,epel,centosplus install -y \
#  gcc\
#  make\
#  openssl-devel\
#  readline-devel\
#  git 

#
# operation user
#
RUN useradd docker
RUN passwd -f -u docker
RUN usermod -s /bin/zsh docker
RUN echo "docker    ALL=(ALL)       ALL" >> /etc/sudoers.d/docker

RUN mkdir -p /home/docker/.ssh; chmod 700 /home/docker/.ssh

ADD resources/home/docker/.ssh/authorized_keys /home/docker/.ssh/authorized_keys
RUN chmod 600 /home/docker/.ssh/authorized_keys

ADD resources/home/docker/.ssh/id_rsa /home/docker/.ssh/id_rsa
RUN chmod 600 /home/docker/.ssh/id_rsa
RUN chown -R docker:docker /home/docker/

#
# App Dir
#
RUN echo 'export PATH=/usr/local/bin:$PATH' >> /root/.bashrc

#
# SSH
#
#RUN /etc/init.d/sshd start
#RUN /etc/init.d/sshd stop

#EXPOSE 22
#CMD ["/usr/sbin/sshd", "-D"]
