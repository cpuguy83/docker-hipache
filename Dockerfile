FROM cpuguy83/ubuntu
RUN apt-get update -qq && apt-get install -y python-software-properties g++ make && apt-add-repository ppa:chris-lea/node.js
RUN apt-get update -qq && apt-get install -y nodejs -qq
RUN npm install hipache -g

RUN mkdir /etc/hipache
ADD config.json /etc/hipache/

VOLUME /etc/hipache
VOLUME /var/log

EXPOSE 80 443

ENTRYPOINT ["/usr/bin/hipache", "-c", "/etc/hipache/config.json"]
