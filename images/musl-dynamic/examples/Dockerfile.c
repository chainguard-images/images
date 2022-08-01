ARG BASE=distroless.dev/musl-dynamic

FROM distroless.dev/gcc-musl as build

COPY hello.c /work/hello.c
RUN cc hello.c -o hello

FROM $BASE

COPY --from=build /work/hello /hello
CMD ["/hello"]
