FROM scratch
WORKDIR /
ADD /pnscan-1.11/pnscan /bin/pnscan
RUN chmod +x /bin/pnscan
ENTRYPOINT ["pnscan"]
CMD ["-h"]
