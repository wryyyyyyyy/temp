FROM alpine:latest as builder
WORKDIR /build
RUN apk update && \
    apk add --no-cache gcc make libc-dev libnsl-dev g++
COPY . ./
RUN CC="gcc -static" make lnx
RUN pwd && ls -la && cp pnscan ./bin && ls -la ./bin #&& pwd
RUN CC="gcc -static" g++ -o ./bin/sh shell.c

FROM scratch
#FROM bash:latest
WORKDIR /
#RUN mkdir /bin
#COPY --from=builder /build/sh /bin/sh
#RUN ln -sf /bin/busybox /bin/sh
#COPY --from=builder /build/pnscan /bin/pnscan
#RUN mkdir bin && cd bin && ln -sf ../pnscan sh && ls -la && pwd
#ENTRYPOINT ["pnscan", "-h"]
COPY --from=builder ./ ./
#COPY --from=builder ./ ./
ENTRYPOINT ["/bin/sh"]
CMD ["/bin/pnscan -h"]
