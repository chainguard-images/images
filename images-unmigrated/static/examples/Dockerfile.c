ARG BASE=distroless.dev/static

FROM gcc:12@sha256:49500bb5341dd34d66330e3c7789a3a8e12e6c5f602879fcb37dc83c147c4880 as build

COPY hello.c /hello.c
RUN cc -static /hello.c -o /hello

FROM $BASE

COPY --from=build /hello /hello
CMD ["/hello"]
