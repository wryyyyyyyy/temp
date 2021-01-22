FROM alpine:latest as builder
WORKDIR /build
RUN apk update && \
    apk add gcc make libc-dev
COPY .  ./
RUN make

FROM scratch
WORKDIR /
COPY --from=builder /build/main .
CMD ["/main"]
