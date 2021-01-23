FROM alpine:latest as builder
WORKDIR /build
RUN apk update && \
    apk add gcc make libc-dev libnsl-dev
COPY . ./
RUN CC="gcc -static" make lnx

FROM scratch as raw
COPY --from=builder /build/pnscan .
ENTRYPOINT ["./pnscan", "-h"]
