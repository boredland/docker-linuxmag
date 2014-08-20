FROM centos:latest
MAINTAINER Mattias Giese <giese@b1-systems.de>
RUN yum install -y mysql mysql-server
ADD start/ /
RUN chmod +x /start.sh
VOLUME /data/mysql:/var/lib/mysql

EXPOSE 3306

CMD ["/start.sh"]

