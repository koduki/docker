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
  syslog\
  wget\
  rsync\
  unzip\
  zsh\
  vim
