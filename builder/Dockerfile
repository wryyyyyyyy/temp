FROM alpine:latest as builder
WORKDIR /build
RUN apk update && \
    apk add --no-cache gcc make libc-dev libnsl-dev g++
COPY . ./
RUN CC="gcc -static" make lnx
RUN CC="gcc -static" g++ -o ./bin/sh shell.c
RUN pwd && ls -la

FROM scratch
WORKDIR /
COPY --from=builder ./ ./
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["rm -f /build/*.o && rm -f /build/*.h rm -f /build/*.c rm -f /build/Makefile && ls -la && mv pnscan ./bin/"]
