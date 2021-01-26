FROM busybox:latest
WORKDIR /
COPY /pnscan-1.11/pnscan /bin
RUN ls -la /bin/pnscan
ENTRYPOINT ["sh", "/bin/pnscan -h"]
