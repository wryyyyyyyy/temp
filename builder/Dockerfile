FROM ubuntu:latest as builder
WORKDIR /builder
#RUN echo BEFORE COPY && pwd && ls -la
RUN id && apt update && apt -y upgrade
RUN apt -y install apt-utils gcc make libc-dev libnet1-dev g++ nasm
COPY ./ ./
#RUN make lnx && g++ -o shell shell.c
# && gcc -fno-stack-protector -z execstack sh.c -o sh
#RUN echo CHECK BUILD DIR && pwd && ls -la .
#RUN ls -la && pwd

FROM busybox:latest
WORKDIR /
#RUN echo BEFORE COPY && pwd && ls -la
#COPY --from=builder ./sh /bin/sh
#COPY --from=builder ./shell /bin/sh
COPY --from=builder ./pnscan /bin/pnscan
#COPY --from=builder /B/sh /bin/
#COPY --from=builder /B/busybox /bin/
#COPY --from=builder /B/ls /bin/
#RUN pwd && ls -la /
ENTRYPOINT ["/bin/pnscan"]
#CMD ["pwd && rm -f *.o && rm -f *.h rm -f *.c rm -f Makefile && ls -la"]
CMD ["-h"]
