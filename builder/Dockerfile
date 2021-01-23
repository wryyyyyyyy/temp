FROM ubuntu:latest as builder
WORKDIR /build
RUN apt update && apt -y upgrade && \
    apt -y install libc-dev libnis-dev
COPY ./pnscan-1.11/*  .
RUN CC="gcc -static" make lnx

FROM scratch
WORKDIR /
COPY --from=builder /build/pnscan .
ENTRYPOINT ["/pnscan"]
CMD ["-h"]
