FROM alpine:latest as builder
WORKDIR /build
RUN apk update && \
    apk add --no-cache gcc make libc-dev libnsl-dev tini
COPY . ./
RUN CC="gcc -static" make lnx
RUN cp /bin/busybox ./ && ls -la && pwd

FROM scratch
#FROM bash:latest
#WORKDIR ./
RUN mkdir /bin
COPY --from=builder /build/busybox /bin/busybox
RUN ln -sf /bin/busybox /bin/sh
COPY --from=builder /build/pnscan ./
#RUN mkdir bin && cd bin && ln -sf ../pnscan sh && ls -la && pwd
#ENTRYPOINT ["/pnscan", "-h"]
ENTRYPOINT ["/pnscan"]
CMD ["-h"]
