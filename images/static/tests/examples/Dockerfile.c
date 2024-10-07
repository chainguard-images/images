ARG BASE=cgr.dev/chainguard/static

FROM cgr.dev/chainguard/gcc-glibc as build

COPY hello.c /hello.c
RUN cc -static /hello.c -o /hello

FROM $BASE

COPY --from=build /hello /usr/local/bin/
CMD ["hello"]
