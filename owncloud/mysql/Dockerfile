FROM centos:centos6
MAINTAINER Mattias Giese <giese@b1-systems.de>
RUN yum install -y mysql mysql-server; yum clean all
#Needed with newer revisions
RUN yum install -y psmisc ; yum clean all
ADD start/ /
RUN chmod +x /start.sh
VOLUME /data/mysql:/var/lib/mysql

EXPOSE 3306

CMD ["/start.sh"]

