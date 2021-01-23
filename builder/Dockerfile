FROM ubuntu:latest as builder
RUN apt update && \
    apt -y install gcc make libc-dev libnis-dev
COPY ./pnscan-1.11/*  ./
RUN CC="gcc -static" make lnx
RUN ls -la

FROM busybox:latest
WORKDIR /
COPY /build/pnscan .
ENTRYPOINT ["./pnscan", "-h"]
