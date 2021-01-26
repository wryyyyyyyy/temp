FROM scratch
WORKDIR /
RUN mkdir bin
ADD /pnscan-1.11/pnscan /bin/pnscan
RUN chmod +x /bin/pnscan
ENTRYPOINT ["pnscan"]
CMD ["-h"]
