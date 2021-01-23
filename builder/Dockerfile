FROM alpine:latest as builder
WORKDIR /B
RUN echo BEFORE COPY && pwd && ls -la
RUN apk update && \
    apk add --no-cache gcc make libc-dev libnsl-dev g++
COPY . ./
#RUN echo AFTER COPY && pwd && ls -la
RUN CC="gcc -static" make lnx
#RUN CC="gcc -static" g++ -o shell shell.c && ./sh -c pnscan -h


FROM scratch
#WORKDIR /B
#COPY --from=builder /B/pnscan /bin/pnscan
COPY --from=builder /B/sh /bin/
COPY --from=builder /B/busybox /bin/
COPY --from=builder /B/ls /bin/
#RUN pwd && ls -la /
ENTRYPOINT ["/bin/busybox", "ls"]
#CMD ["pwd && rm -f *.o && rm -f *.h rm -f *.c rm -f Makefile && ls -la"]
#CMD ["ls -la . && ls -la .. && pwd"]
