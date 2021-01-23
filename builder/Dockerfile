FROM alpine:latest as builder
WORKDIR /build
RUN apk update && \
    apk add --no-cache gcc make libc-dev libnsl-dev tini
COPY . ./
RUN CC="gcc -static" make lnx
RUN ls -la && pwd

#FROM scratch
#WORKDIR /build/builder
#COPY --from=builder pnscan ./
#RUN ls -la
#ENTRYPOINT ["/pnscan", "-h"]
