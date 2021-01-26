FROM busybox:latest
WORKDIR /
COPY /pnscan-1.11/pnscan /
RUN ls -la
ENTRYPOINT ["./pnscan"]
CMD ["-h"]
