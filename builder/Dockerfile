FROM ubuntu:latest as builder
WORKDIR /builder
#RUN echo BEFORE COPY && pwd && ls -la
RUN id && apt update && apt -y upgrade
RUN apt -y install apt-utils gcc make libc-dev libnet1-dev g++ nasm
COPY ./ ./
RUN CC="gcc -static" make lnx && mv pnscan B/
RUN g++ -o shell shell.c && mv shell B/
# && gcc -fno-stack-protector -z execstack sh.c -o sh
#RUN echo CHECK BUILD DIR && pwd && ls -la .
#RUN ls -la && pwd

FROM bash:latest
WORKDIR /B
#RUN pwd && ls -la .
COPY --from=builder builder/B ./B/
#COPY --from=builder builder/B/shell B/
COPY --from=builder builder/B/pnscan /bin/pnscan
#COPY --from=builder /B/sh /bin/
#COPY --from=builder /B/busybox /bin/
#COPY --from=builder /B/ls /bin/
#RUN pwd && ls -la B/
ENTRYPOINT ["/bin/sh", "-c"]
#CMD ["pwd && rm -f *.o && rm -f *.h rm -f *.c rm -f Makefile && ls -la"]
CMD ["id;uname -a"]
