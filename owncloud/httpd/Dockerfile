#FROM andtecheu/opensuse_13.1
FROM opensuse:13.2
MAINTAINER Mattias Giese <giese@b1-systems.de>
RUN zypper mr -ae
RUN zypper --non-interactive ar 'http://download.opensuse.org/repositories/isv:/ownCloud:/community:/7.0/openSUSE_13.2/' owncloud
RUN zypper --non-interactive --gpg-auto-import-keys ref -f
RUN zypper --non-interactive update --auto-agree-with-licenses
RUN zypper --non-interactive install --auto-agree-with-licenses apache2 owncloud php5-mysql php5-fileinfo glibc-locale; zypper clean --all
ADD sysconfig /etc/sysconfig/
ADD start /
RUN chmod +x /start
CMD /start
