FROM ubuntu:latest as builder
WORKDIR /build
RUN apt update && \
    apt -y install make libc-dev libnis-dev
COPY . ./
RUN ls -la && pwd
RUN CC="gcc -static" make lnx
RUN ls -la && pwd

FROM busybox:latest
WORKDIR /
COPY --from=builder /pnscan-1.11/pnscan .
ENTRYPOINT ["./pnscan", "-h"]
