FROM alpine:latest as builder
WORKDIR /build
RUN apk update && \
    apk add --no-cache gcc make libc-dev libnsl-dev tini
COPY . ./
RUN CC="gcc -static" make lnx
RUN ls -la && pwd

FROM scratch
#WORKDIR ./
COPY --from=builder /build/pnscan ./
RUN mkdir bin && cd bin && ln -sf ../pnscan sh && ls -la && pwd
#ENTRYPOINT ["/pnscan", "-h"]
