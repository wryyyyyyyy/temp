FROM alpine:latest as builder
WORKDIR /build
RUN apk update && \
    apk add gcc make libc-dev libnsl-dev
COPY . ./
RUN CC="gcc -static" make lnx -j3

FROM scratch as nope
COPY --from=builder /build/pnscan .
ENTRYPOINT ["./pnscan", "-h"]
