FROM alpine:latest as builder
WORKDIR /build
RUN apk update && \
    apk add gcc make libc-dev libnsl-dev
COPY .  ./
RUN make lnx

FROM scratch
WORKDIR /
COPY --from=builder /build/pnscan .
ENTRYPOINT ["/pnscan"]
CMD ["-h"]
