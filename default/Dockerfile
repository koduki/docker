FROM centos
MAINTAINER koduki

#
# set repositories
#
RUN yum update -y
RUN yum install -y wget

RUN wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm ;\
    wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm ;\
    rpm -ivh epel-release-6-8.noarch.rpm remi-release-6.rpm

#
# Install default packages
#
RUN yum --enablerepo=remi,epel install -y \
  sudo\
  openssh\
  openssh-server\
  openssh-clients\
  syslog\
  wget\
  rsync\
  unzip\
  zsh\
  nkf\
  vim

#
# operation user
#
RUN useradd docker
RUN passwd -f -u docker
RUN usermod -s /bin/zsh docker

RUN mkdir -p /home/docker/.ssh; chown docker /home/docker/.ssh; chmod 700 /home/docker/.ssh
ADD resources/home/docker/.ssh/authorized_keys /home/docker/.ssh/authorized_keys
RUN chown docker /home/docker/.ssh/authorized_keys; chmod 600 /home/docker/.ssh/authorized_keys
RUN echo "docker    ALL=(ALL)       ALL" >> /etc/sudoers.d/docker

ADD resources/home/docker/.zshrc /home/docker/.zshrc
ADD resources/home/docker/.zshrc.mine /home/docker/.zshrc.mine
RUN chown -R docker:docker /home/docker/


#
# run ssh
#
#ADD ./sshd_config /etc/ssh/sshd_config
RUN /etc/init.d/sshd start
RUN /etc/init.d/sshd stop
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

