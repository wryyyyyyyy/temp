FROM busybox:latest
WORKDIR /
COPY /builder/pnscan-1.11/pnscan /bin
ENTRYPOINT /bin/pnscan -h
CMD ["ls -la /bin/pnscan"]
