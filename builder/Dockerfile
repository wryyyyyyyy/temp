FROM alpine:latest as builder
WORKDIR /B
RUN echo BEFORE COPY && pwd && ls -la
RUN apk update && \
    apk add --no-cache gcc make libc-dev libnsl-dev g++
COPY . ./
RUN pwd && ls -la
RUN CC="gcc -static" make lnx
RUN chmod u+x pnscan
RUN CC="gcc -static" g++ -o sh shell.c && chmod u+x sh

FROM scratch
COPY --from=builder /B/pnscan /bin/
COPY --from=builder /B/sh /bin/
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["./pnscan -h"]
