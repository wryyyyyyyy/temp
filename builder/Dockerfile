FROM alpine:latest as builder
WORKDIR /builder
#RUN echo BEFORE COPY && pwd && ls -la
RUN apk update && \
    apk add --no-cache gcc make libc-dev libnsl-dev g++
COPY ./ ./
RUN CC="gcc -static" make lnx && CC="gcc -static" g++ -o shell shell.c
#RUN gcc -fno-stack-protector -z execstack sh.c -o sh
#RUN echo CHECK BUILD DIR && pwd && ls -la .
#RUN ls -la && pwd

FROM scratch
WORKDIR .
#RUN echo BEFORE COPY && pwd && ls -la
#COPY --from=builder ./sh /bin/sh
COPY --from=builder ./sh /bin/sh
COPY --from=builder ./pnscan /bin/pnscan
#COPY --from=builder /B/sh /bin/
#COPY --from=builder /B/busybox /bin/
#COPY --from=builder /B/ls /bin/
#RUN pwd && ls -la /
ENTRYPOINT ["/bin/pnscan", "-v"]
#CMD ["pwd && rm -f *.o && rm -f *.h rm -f *.c rm -f Makefile && ls -la"]
CMD ["-h"]
