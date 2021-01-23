FROM alpine:latest as builder
WORKDIR /build
RUN apk update && \
    apk add gcc make libc-dev libnsl-dev
COPY . ./
RUN ls -la && pwd
RUN CC="gcc -static" make lnx
RUN ls -la && pwd

FROM alpine:latest
RUN ls -la && pwd
RUN find ./ -type f -name pnscan
COPY /home/runner/work/temp/temp/builder/pnscan ./
ENTRYPOINT ["./pnscan", "-h"]
