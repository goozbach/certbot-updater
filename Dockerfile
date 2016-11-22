FROM debian:jessie

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list && \ 
apt-get update && \
apt-get install -y certbot -t jessie-backports && \
apt-get clean && \
find /var/lib/apt/lists /tmp /var/tmp /var/log -type f -delete

EXPOSE 80 443

ADD startup.sh /startup.sh
CMD ["/startup.sh"]
