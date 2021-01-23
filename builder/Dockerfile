FROM alpine:latest as builder
WORKDIR /build
RUN apk update && \
    apk add --no-cache gcc make libc-dev libnsl-dev tini
COPY . ./
RUN cd builder && ls -la && pwd
RUN CC="gcc -static" make lnx

FROM scratch
WORKDIR /
COPY --from=builder /build/pnscan .
ENTRYPOINT ["/pnscan", "-h"]
