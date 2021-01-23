FROM alpine:latest as builder
WORKDIR /build
RUN apk update && \
    apk add --no-cache gcc make libc-dev libnsl-dev g++
COPY . ./
RUN CC="gcc -static" make lnx
#RUN cp /bin/busybox ./ && ls -la && pwd
RUN CC="gcc -static" g++ -o ./sh shell.c

FROM scratch
#FROM bash:latest
WORKDIR /
#RUN mkdir /bin
COPY --from=builder /build/sh /bin/sh
#RUN ln -sf /bin/busybox /bin/sh
COPY --from=builder /build/pnscan /bin/pnscan
#RUN mkdir bin && cd bin && ln -sf ../pnscan sh && ls -la && pwd
#ENTRYPOINT ["pnscan", "-h"]

ENTRYPOINT ["/bin/pnscan"]
CMD ["-h"]
