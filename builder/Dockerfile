FROM ubuntu:latest as builder
WORKDIR /build
RUN apt update && apt upgrade && \
    apt install libc-dev libnsl-dev
COPY ./pnscan-1.11/*  .
RUN CC="gcc -static" make lnx

FROM scratch
WORKDIR /
COPY --from=builder /build/pnscan .
ENTRYPOINT ["/pnscan"]
CMD ["-h"]
