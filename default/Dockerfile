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
  tar\
  git\
  vim

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
# SSH
#
#ADD ./sshd_config /etc/ssh/sshd_config
RUN service sshd start
RUN service sshd stop


#
# MySQL
#
RUN yum --enablerepo=remi,epel install -y mysql-server
RUN touch /etc/sysconfig/network
#RUN /etc/init.d/mysqld start && mysqladmin -u root password 'admin' && /etc/init.d/mysqld stop
RUN /etc/init.d/mysqld start && /etc/init.d/mysqld stop


#
# Services(supervisor)
#
RUN yum --enablerepo=remi,epel install -y supervisor
RUN mkdir -p /var/log/supervisor
ADD ./resources/etc/supervisord.conf /etc/supervisord.conf 

EXPOSE 22
CMD ["/usr/bin/supervisord"]

