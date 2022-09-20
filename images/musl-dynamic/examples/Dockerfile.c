ARG BASE=cgr.dev/chainguard/musl-dynamic

FROM cgr.dev/chainguard/gcc-musl as build

COPY hello.c /work/hello.c
RUN cc hello.c -o hello

FROM $BASE

COPY --from=build /work/hello /hello
CMD ["/hello"]
