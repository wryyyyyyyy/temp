FROM scratch
WORKDIR /
COPY /builder/pnscan-1.11/pnscan .
RUN export PATH=.
ENTRYPOINT ["pnscan", "-h"]
