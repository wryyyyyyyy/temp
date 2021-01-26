FROM busybox:latest
WORKDIR /
COPY /pnscan-1.11/pnscan /bin
RUN ls -la
ENTRYPOINT ["/bin/pnscan"]
CMD ["-h"]
