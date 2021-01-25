FROM alpine:latest as builder
WORKDIR /builder
RUN apk update && \
    apk add gcc make libc-dev
RUN wget ftp://ftp.lysator.liu.se/pub/unix/pnscan/pnscan-1.11.tar.gz
RUN tar zxvf pnscan-1.11.tar.gz && cd pnscan-1.11 && make && cd ..

#FROM busybox:latest
#WORKDIR /
#ENTRYPOINT ["/bin/busybox"]
#CMD ["ls -la"]
