FROM alpine:latest as builder
WORKDIR /build
RUN apk update && \
    apk add gcc make libc-dev libnsl-dev
COPY . ./
RUN ls -la && pwd
RUN CC="gcc -static" make lnx
RUN ls -la && pwd

FROM bash:latest
WORKDIR .
RUN ls -la && pwd
COPY pnscan ./
ENTRYPOINT ["./pnscan", "-h"]
