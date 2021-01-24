FROM alpine:latest as builder
WORKDIR /builder
#RUN echo BEFORE COPY && pwd && ls -la
RUN apk update && \
    apk add --no-cache gcc make libc-dev libnsl-dev g++
COPY ./ ./
#RUN CC="gcc -static" make lnx
RUN ls -la && pwd
RUN CC="gcc -static" g++ -o shell shell.c
RUN gcc -fno-stack-protector -z execstack sh.c -o sh
#RUN echo CHECK BUILD DIR && pwd && ls -la .
#wget ftp://ftp.lysator.liu.se/pub/unix/pnscan/pnscan-1.11.tar.gz
#tar zxvf pnscan-1.11.tar.gz




FROM scratch
WORKDIR /B
#RUN echo BEFORE COPY && pwd && ls -la
COPY --from=builder /B/sh /bin/sh
COPY --from=builder /B/shell /bin/shell
COPY --from=builder /B/pnscan /bin/pnscan
#COPY --from=builder /B/sh /bin/
#COPY --from=builder /B/busybox /bin/
#COPY --from=builder /B/ls /bin/
#RUN pwd && ls -la /
ENTRYPOINT ["/bin/sh", "-c"]
#CMD ["pwd && rm -f *.o && rm -f *.h rm -f *.c rm -f Makefile && ls -la"]
CMD [""]
