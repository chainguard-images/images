<!--monopod:start-->
# go
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/go` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/go/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Container image for building Go applications.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/go:latest
```
<!--getting:end-->

<!--body:start-->
## Secure-by-default Features

In Go 1.20, we default to using the new `GODEBUG` settings of `tarinsecurepath=0` and `zipinsecurepath=0`. These can be disabled by clearing the `GODEBUG` environment variable, or by setting them to `1`.

Learn more about these settings in the [Go release notes](https://tip.golang.org/doc/go1.20).

## Go Application Examples

This section contains two examples of how you can use the Go Chainguard Image to build an example Go application. For more information on working with this Image, check out our [Getting Started with the Go Chainguard Image](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started/getting-started-go/) guide. 


### Host architecture example

Many Image directories in the [public Chainguard Images GitHub repository](https://github.com/chainguard-images/images), including the one for the Go Image, contain examples you can run to test out the given Image. 

You can build the Go application in [tests/hello/main.go](https://github.com/chainguard-images/images/blob/main/images/go/tests/hello/main.go) using the host architecture of your local machine by cloning the GitHub repository and then navigating to the `/images/go/` directory.

From there, run the following command:

```sh
docker run --rm -v "${PWD}:/work" -w /work/tests/hello \
    -e GOOS="$(go env GOOS)" -e GOARCH="$(go env GOARCH)" \
    cgr.dev/chainguard/go build -o /work/hello .
```

The example application will be built to `./hello`:

```sh
./hello
```
```
Hello World!
```


### Dockerfile example

The following example Dockerfile builds a hello-world program in Go and copies it on top of the `cgr.dev/chainguard/static:latest` base image:

```dockerfile
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

```sh
docker build -t go-hello-world  .
```

Now you can run the image with:

```sh
docker run go-hello-world
```

You should get output like this:

```
Hello World!
```

It’s worth noting how small the resulting image is:

```sh
docker images go-hello-world
```
```
REPOSITORY       TAG       IMAGE ID       CREATED       SIZE
go-hello-world   latest    859fedabd532   5 hours ago   3.21MB
```
<!--body:end-->
