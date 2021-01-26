FROM busybox:latest
WORKDIR /
COPY /builder/pnscan-1.11/pnscan /bin
RUN ls -la /bin/pnscan
ENTRYPOINT ["sh","-c"]
CMD ["env"]
