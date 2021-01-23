FROM Ubuntu-20.04:latest as builder
WORKDIR /build
RUN apt update && \
    apt add libc-dev libnsl-dev
COPY .  ./
RUN CC="gcc -static" make lnx

FROM scratch
WORKDIR /
COPY --from=builder /build/pnscan .
ENTRYPOINT ["/pnscan"]
CMD ["-h"]
