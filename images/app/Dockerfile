FROM koduki/base
MAINTAINER koduki

#
# MySQL
#
RUN yum --enablerepo=remi,epel install -y mysql-server
RUN touch /etc/sysconfig/network
#RUN /etc/init.d/mysqld start && mysqladmin -u root password 'admin' && /etc/init.d/mysqld stop
RUN /etc/init.d/mysqld start && /etc/init.d/mysqld stop

#
# MongoDB
#
ADD resources/etc/yum.repos.d/mongodb.repo 
RUN yum -y install mongodb-org
RUN echo 'smallfiles = true' >> /etc/mongod.conf # make journal small

#
# Ruby Environment
#
# Install ruby
RUN wget -P /root/src ftp://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.2.tar.gz
RUN cd /root/src; tar xvf ruby-2.1.2.tar.gz
RUN cd /root/src/ruby-2.1.2; ./configure; make install

# Install bundler
RUN gem update --system
RUN gem install bundler

# for Nokogiri
RUN yum --enablerepo=remi,epel install -y libxml2-devel libxslt-devel
RUN bundle config build.nokogiri --use-system-libraries


#
# Angurar JS Environment
#
RUN yum --enablerepo=remi,epel install -y npm nodejs
RUN npm install -g grunt-cli grunt yo generator-angular
RUN gem install compass

#
# Services(supervisor)
#
RUN yum --enablerepo=remi,epel install -y supervisor
RUN mkdir -p /var/log/supervisor
ADD ./resources/etc/supervisord.conf /etc/supervisord.conf

EXPOSE 22 9000
CMD ["/usr/bin/supervisord"]
