FROM alpine:latest as builder
WORKDIR /build
RUN apk update && \
    apk add gcc make libc-dev libnsl-dev
COPY . ./
RUN CC="musl-gcc -static" make lnx

FROM scratch
COPY --from=builder /build/pnscan .
ENTRYPOINT ["./pnscan", "-h"]
