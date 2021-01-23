FROM ubuntu:latest as builder
WORKDIR /
RUN apt update && \
    apt -y install make libc-dev libnis-dev
RUN cd pnscan-1.11 && ls -la && pwd
RUN CC="gcc -static" make lnx
RUN ls -la && pwd

FROM busybox:latest
WORKDIR /
COPY --from=builder /pnscan-1.11/pnscan .
ENTRYPOINT ["./pnscan", "-h"]
