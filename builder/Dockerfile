FROM alpine:latest as builder
WORKDIR /build
RUN apk update && \
    apk add --no-cache gcc make libc-dev libnsl-dev tini
COPY . ./
RUN cd builder && CC="gcc -static" make lnx

FROM scratch
WORKDIR /
COPY --from=builder /build/builder/pnscan ./
RUN ls -la
ENTRYPOINT ["/pnscan", "-h"]
