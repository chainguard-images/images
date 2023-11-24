<!--monopod:start-->
# go
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/go` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/go/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Container image for building Go applications.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/go:latest
```
<!--getting:end-->

<!--body:start-->
## Usage



## Host architecture example

To build the Go application in [tests/hello/main.go](https://github.com/chainguard-images/images/blob/main/images/go/tests/hello/main.go)
using the host architecture:

```sh
docker run --rm -v "${PWD}:/work" -w /work/tests/hello \
    -e GOOS="$(go env GOOS)" -e GOARCH="$(go env GOARCH)" \
    cgr.dev/chainguard/go build -o /work/hello .
```

The example application will be built to `./hello`:

```
$ ./hello
Hello World!
```

## Secure-by-default Features

In Go 1.20, we default to using the new `GODEBUG` settings of `tarinsecurepath=0` and `zipinsecurepath=0`.
These can be disabled by clearing the `GODEBUG` environment variable, or by setting them to `1`.

Learn more about these settings in the [Go release notes](https://tip.golang.org/doc/go1.20).

## Dockerfile example

The following example Dockerfile builds a hello-world program in Go and copies it on top of the `cgr.dev/chainguard/static:latest` base image:

```dockerfile
# syntax=docker/dockerfile:1.4
FROM cgr.dev/chainguard/go:latest as build

WORKDIR /work

COPY <<EOF go.mod
module hello
go 1.19
EOF

COPY <<EOF main.go
package main
import "fmt"
func main() {
    fmt.Println("Hello World!")
}
EOF
RUN go build -o hello .

FROM cgr.dev/chainguard/static:latest

COPY --from=build /work/hello /hello
CMD ["/hello"]
```

Run the following command to build the demo image and tag it as `go-hello-world`:

```shell
docker build -t go-hello-world  .
```

Now you can run the image with:

```shell
docker run go-hello-world
```

You should get output like this:

```
Hello World!
```

It’s worth noting how small the resulting image is:

```shell
docker images go-hello-world
```

```
REPOSITORY       TAG       IMAGE ID       CREATED       SIZE
go-hello-world   latest    859fedabd532   5 hours ago   3.21MB
```
<!--body:end-->
