ARG BASE=distroless.dev/alpine-base

FROM golang:1.18 as build

WORKDIR /go/src/app
COPY . .

RUN go mod download
RUN go build -o /go/bin/app

FROM $BASE

COPY --from=build /go/bin/app /
CMD ["/app"]