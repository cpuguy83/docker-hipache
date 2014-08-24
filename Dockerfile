FROM debian:jessie

ENV HIPACHE_VERSION 0.3.1

RUN apt-get update && apt-get install -y nodejs npm --no-install-recommends git
RUN git clone https://github.com/hipache/hipache.git && cd hipache && git checkout $HIPACHE_VERSION
RUN npm install -g ./hipache --production
ADD config.json /etc/hipache/config.json
VOLUME /etc/hipache

EXPOSE 80 443

CMD ["/usr/local/bin/hipache", "-c", "/etc/hipache/config.json"]
