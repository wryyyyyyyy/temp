FROM alpine:latest as builder
WORKDIR /build
RUN apk update && \
    apk add gcc make libc-dev libnsl-dev
COPY . ./
RUN ls -la && pwd
RUN CC="gcc -static" make lnx
RUN ls -la && pwd

FROM busybox:latest
WORKDIR /
COPY --from=builder /pnscan-1.11/pnscan .
ENTRYPOINT ["./pnscan", "-h"]
