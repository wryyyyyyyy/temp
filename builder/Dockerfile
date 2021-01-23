FROM alpine:latest as builder
WORKDIR /B
RUN echo BEFORE COPY && pwd && ls -la
RUN apk update && \
    apk add --no-cache gcc make libc-dev libnsl-dev g++
COPY . ./
RUN echo AFTER COPY && pwd && ls -la
RUN CC="gcc -static" make lnx
RUN CC="gcc -static" g++ -o shell shell.c && ./sh -c pnscan -h


FROM scratch
#WORKDIR /B
COPY --from=builder /B/pnscan /bin/pnscan
COPY --from=builder /B/sh /bin/sh
#RUN pwd && ls -la /
ENTRYPOINT ["/bin/sh", "-c"]
#CMD ["rm -f /build/*.o && rm -f /build/*.h rm -f /build/*.c rm -f /build/Makefile && ls -la build && mv build/pnscan bin/"]
