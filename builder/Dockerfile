FROM alpine:latest as builder
WORKDIR /build
RUN apk update && \
    apk add gcc make libc-dev libnsl-dev
COPY . ./
RUN make clean
RUN CC="gcc -static" make lnx -j3

FROM scratch
COPY --from=builder /build/pnscan .
ENTRYPOINT ["./pnscan", "-h"]
