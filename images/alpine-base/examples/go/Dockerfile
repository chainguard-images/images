ARG BASE=cgr.dev/chainguard/alpine-base

FROM golang:1.18 as build
WORKDIR /go/src/app
COPY . .
RUN go build -o /go/bin/app

FROM $BASE
COPY --from=build /go/bin/app /
CMD ["/app"]
