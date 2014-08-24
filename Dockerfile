FROM debian:jessie


RUN apt-get update && apt-get install -y nodejs npm --no-install-recommends git
RUN git clone https://github.com/hipache/hipache.git
RUN npm install -g ./hipache --production
ADD config.json /etc/hipache/config.json
VOLUME /etc/hipache

EXPOSE 80 443

CMD ["/usr/local/bin/hipache", "-c", "/etc/hipache/config.json"]
