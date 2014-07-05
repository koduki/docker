FROM koduki/centos
MAINTAINER koduki

#
# MySQL
#
RUN yum --enablerepo=remi,epel install -y mysql-server
RUN touch /etc/sysconfig/network
#RUN /etc/init.d/mysqld start && mysqladmin -u root password 'admin' && /etc/init.d/mysqld stop
RUN /etc/init.d/mysqld start && /etc/init.d/mysqld stop


#
# Ruby Environment
#
RUN yum --enablerepo=remi,epel install -y libxml2-devel libxslt1-dev
RUN cd /usr/local/ && git clone git://github.com/sstephenson/rbenv.git
RUN echo 'export RBENV_ROOT="/usr/local/rbenv"' >> /etc/profile.d/rbenv.sh
RUN echo 'export PATH="${RBENV_ROOT}/bin:${PATH}"' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh

RUN mkdir /usr/local/rbenv/plugins
RUN cd /usr/local/rbenv/plugins && git clone git://github.com/sstephenson/ruby-build.git

RUN bash -lc 'rbenv install 2.1.2'
RUN bash -lc 'rbenv global  2.1.2'
RUN bash -lc 'rbenv exec gem install bundler'
RUN bash -lc 'rbenv rehash'

#
# Angurar JS Environment
#
RUN yum --enablerepo=remi,epel install -y npm nodejs
RUN npm install -g grunt-cli grunt yo generator-angular
RUN bash -lc 'rbenv exec gem install compass'
RUN bash -lc 'rbenv rehash'

#
# Services(supervisor)
#
RUN yum --enablerepo=remi,epel install -y supervisor
RUN mkdir -p /var/log/supervisor
ADD ./resources/etc/supervisord.conf /etc/supervisord.conf

EXPOSE 22 9000
CMD ["/usr/bin/supervisord"]
