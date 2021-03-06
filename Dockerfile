FROM golang:1.13.1-buster

ADD docker-entry.sh /

RUN  apt-get update && \
apt-get install -y git && \
go get -v -u github.com/FreifunkBremen/yanic && \
mkdir -p /var/lib/yanic && \
mkdir -p /var/www/html/meshviewer/data && \
touch /var/log/yanic.log && \
apt-get -y dist-upgrade && \
apt-get autoremove && \
apt-get clean && \
chmod +x /docker-entry.sh

ENTRYPOINT ["/docker-entry.sh"]
EXPOSE 8080

CMD ['yanic serve /etc/yanic.conf']

