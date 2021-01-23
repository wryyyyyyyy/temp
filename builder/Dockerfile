FROM alpine:latest as builder
WORKDIR /builder
RUN echo BEFORE APK && pwd && ls -la ./
RUN apk update && \
    apk add --no-cache gcc make libc-dev libnsl-dev g++
#COPY . ./
RUN echo AFTER APK && pwd && ls -la ./
RUN CC="gcc -static" make lnx
RUN chmod u+x pnscan
RUN CC="gcc -static" g++ -o sh shell.c && chmod u+x sh
RUN echo BUILDING SCRATCH IMAGE
FROM scratch
COPY --from=builder /builder/pnscan /bin/
COPY --from=builder /builder/sh /bin/
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["./pnscan -h"]
