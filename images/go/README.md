<!--monopod:start-->
# REPO_NAME
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/REPO_NAME` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/REPO_NAME/versions) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for REPO_NAME

Container image for building Go applications.

Chainguard Containers are regularly-updated, secure-by-default container images.
<!--overview:end-->

<!--getting:start-->
## Download this Container Image
For those with access, this container image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/REPO_NAME:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard Registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes

Where possible, the Go Chainguard Image is built for compatibility with the [Docker official image for Golang](https://hub.docker.com/_/golang/). 

Unlike most other Chainguard images, the Go image contains a shell; namely, Bash. The reason for this is that this image is meant to be used as a build image, not a runtime image. The Go binary itself isn't very useful, so the Go Chainguard image contains Bash, along with tools like `make` and `gcc`, to allow users to build binaries.

The Go Chainguard Image uses the `glibc` implementation of the C standard library, while the Alpine version of the Golang official Docker Image uses `musl`. See our [article on glibc vs. musl](https://edu.chainguard.dev/chainguard/chainguard-images/about/images-compiled-programs/glibc-vs-musl/) on Chainguard Academy for an overview of the differences between these implementations.

When using the Chainguard Go image, we advise to use shared linking and the `glibc-dynamic runtime` image as static linking of C/C++ code can often create dark matter and invade scanners. As an alternative, we recommend using the `static` image as the runtime image, as it still provides CA certs for TLS. If using `go-msft-fips`, we recommend using `glibc-openssl-fips`.

The examples in this README recommend executing Go binaries from one of our runtime Chainguard Images, such as the `glibc-dynamic` or `static` Chainguard Images. If using the `static` Chainguard Image, make sure to build your Go binary with static linking. In most cases, this requires running `CGO_ENABLED=0 go build` when building the binary. If dynamic linking is needed, use the `glibc-dynamic` Chainguard Image or the Go Chainguard Image to run your application. 

In Go 1.20, we default to using the new `GODEBUG` settings of `tarinsecurepath=0` and `zipinsecurepath=0`. These can be disabled by clearing the `GODEBUG` environment variable, or by setting them to `1`.

Learn more about these settings in the [Go release notes](https://tip.golang.org/doc/go1.20).

## Getting Started

### Example: CLI Application Using Multi-Stage Build

The following build demonstrates a command line application with support for flags and positional arguments. The application prints a modifiable greeting message and provides usage information if the wrong number of arguments are passed by a user or the user passes an unrecognized flag.

First, create a project folder and change the working directory to that folder:

```sh
mkdir -p ~/go-greeter && cd $_
```

Next, ,write a file defining our Go CLI application (`main.go`:

```sh
cat << 'EOF' > main.go
package main

import (
	"flag"
	"fmt"
	"log"
	"os"
)

func usage() {
	fmt.Fprintf(os.Stderr, "usage: hello [options] [name]\n")
	flag.PrintDefaults()
	os.Exit(2)
}

var (
	greeting = flag.String("g", "Hello", "Greet with `greeting`")
)

func main() {
	// Configure logging
	log.SetFlags(0)
	log.SetPrefix("hello: ")

	// Parse flags.
	flag.Usage = usage
	flag.Parse()

	// Parse and validate arguments.
	name := "Linky 🐙"
	args := flag.Args()
	if len(args) >= 2 {
		usage()
	}
	if len(args) >= 1 {
		name = args[0]
	}
	if name == "" { // hello '' is an error
		log.Fatalf("invalid name %q", name)
	}

	fmt.Printf("%s, %s!\n", *greeting, name)
}
EOF
```

Create a go.mod` file to list dependencies:

```sh
cat << 'EOF' > go.mod
module chainguard.dev/greet

go 1.19
EOF
```

Write a `Dockerfile` to define our image build:

```sh
cat << 'EOF' > Dockerfile
FROM cgr.dev/chainguard/go AS builder
COPY . /app
RUN cd /app && go build -o go-greeter .

FROM cgr.dev/chainguard/static
COPY --from=builder /app/go-greeter /usr/bin/
ENTRYPOINT ["/usr/bin/go-greeter"]
EOF
```

The `Dockerfile` uses a multi-stage build approach, compiling the application using the `go` Chainguard Image, then copying the binary to the `static` Chainguard Image for execution. Note that the `static` image requires that the Go binary be statically linked—if your application requires dynamic linking, consider using the `glibc-dynamic` Chainguard Image for your runtime (see the second example in this README).

Build the image, tagging it `go-greeter`:

```sh
docker build . -t go-greeter
```

Run the image:

```sh
docker run go-greeter
```

You should see output similar to the following:

```
Hello, Linky 🐙!
```

You can also pass in arguments that will be parsed by the Go CLI application: 

```sh
docker run go-greeter -g Greetings "Chainguard user"
```

This will produce the following output:

```
Greetings, Chainguard user!
```

The application will also share usage instructions when prompted with the `--help` flag or when invalid flags are passed.

Because we used the `static` Chainguard Image as our runtime, the final image only requires a few megabytes on disk:


```sh
docker inspect go-greeter | jq -c 'first' | jq .Size | numfmt --to iec --format "%8.4f"
```

The final size, `3.5055M`, is orders of magnitude smaller than it would be running the application using a Go image. However, if your application is dynamically linked to shared objects, consider using the `glibc-dynamic` Chainguard Image for your runtime or take extra steps to build your Go binary statically.

### Example: Web Application

The following build demonstrates an application that's accessible by HTTP server. The application renders a simple message that changes based on the URI.

First, create a project folder and change the working directory to that folder:

```sh
mkdir -p ~/greet-server && cd $_
```

Next, write a `main.go` file defining our web application:

```sh
cat << 'EOF' > main.go
package main

import (
	"flag"
	"fmt"
	"html"
	"log"
	"net/http"
	"os"
	"runtime/debug"
	"strings"
)

func usage() {
	fmt.Fprintf(os.Stderr, "usage: helloserver [options]\n")
	flag.PrintDefaults()
	os.Exit(2)
}

var (
	greeting = flag.String("g", "Hello", "Greet with `greeting`")
	addr     = flag.String("addr", "0.0.0.0:8080", "address to serve")
)

func main() {
	// Parse flags.
	flag.Usage = usage
	flag.Parse()

	// Parse and validate arguments (none).
	args := flag.Args()
	if len(args) != 0 {
		usage()
	}

	// Register handlers. for greeting and version
	http.HandleFunc("/", greet)
	http.HandleFunc("/version", version)

	log.Printf("serving http://%s\n", *addr)
	log.Fatal(http.ListenAndServe(*addr, nil))
}

func version(w http.ResponseWriter, r *http.Request) {
	info, ok := debug.ReadBuildInfo()
	if !ok {
		http.Error(w, "no build information available", 500)
		return
	}

	fmt.Fprintf(w, "<!DOCTYPE html>\n<pre>\n")
	fmt.Fprintf(w, "%s\n", html.EscapeString(info.String()))
}

func greet(w http.ResponseWriter, r *http.Request) {
	name := strings.Trim(r.URL.Path, "/")
	if name == "" {
		name = "Linky 🐙"
	}

	fmt.Fprintf(w, "<!DOCTYPE html>\n")
	fmt.Fprintf(w, "%s, %s!\n", *greeting, html.EscapeString(name))
}
EOF
```

Next, write a `go.mod` file listing dependencies:

```sh
cat << 'EOF' > go.mod
module chainguard.dev/greet-server

go 1.19
EOF
```

Write a `Dockerfile` to define our image build:

```sh
cat << 'EOF' > Dockerfile
FROM cgr.dev/chainguard/go AS builder
COPY . /app
RUN cd /app && go build

FROM cgr.dev/chainguard/glibc-dynamic
COPY --from=builder /app/greet-server /usr/bin/

EXPOSE 8080

ENTRYPOINT ["/usr/bin/greet-server"]
EOF
```

The `Dockerfile` uses a multi-stage build approach, compiling the application using the `go` Chainguard Image, then copying the binary to the `glibc-dynamic` Chainguard Image to serve.

Build the image, tagging it `greet-server`:

```sh
docker build . -t greet-server
```

Run the image:

```sh
docker run -p 8080:8080 greet-server
```

Visit [http://0.0.0.0:8080/](http://0.0.0.0:8080/) using a web browser on your host machine. You should see the following:

```
Hello, Linky 🐙!
```

Changes to the URI will be routed to the application. Try visiting [http://0.0.0.0:8080/Chainguard%20Customer](http://0.0.0.0:8080/Chainguard%20Customer). You should see the following output:

```
Hello, Chainguard Customer!
```

The application will also share version information at [http://0.0.0.0:8080/version](http://0.0.0.0:8080/version).

If you're building a web application with Go, consider the [nginx](https://images.chainguard.dev/directory/image/nginx/overview) Chainguard Image for use as a reverse proxy.

## Documentation and Resources

- [Chainguard Academy: Getting Started with the Go Chainguard Image](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started/go/)
- [Video: Migrating a Dockerfile for a Go application to use Chainguard Images](https://edu.chainguard.dev/chainguard/migration/migration-guides/migrating_go/)
- [Blog Post: Statically Linking Go in 2022](https://mt165.co.uk/blog/static-link-go/)
- [Blog Post: Building minimal and low CVE images for compiled languages](https://www.chainguard.dev/unchained/building-minimal-and-low-cve-images-for-compiled-languages)
- [Chainguard Academy: glibc vs. musl](https://edu.chainguard.dev/chainguard/chainguard-images/about/images-compiled-programs/glibc-vs-musl/)
<!--body:end-->

## What are Chainguard Containers?

Chainguard's free tier of Starter container images are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview?utm_source=readmes), our minimal Linux _[undistro](https://edu.chainguard.dev/open-source/wolfi/overview/#why-undistro)_.

All other Chainguard Containers are built with [Chainguard OS](https://edu.chainguard.dev/chainguard/chainguard-os/overview/?utm_source=readmes), Chainguard's minimal Linux operating system designed to produce container images that meet the requirements of a more secure software supply chain.

The main features of Chainguard Containers include:

* Minimal design, without unnecessary software bloat
* Daily builds to ensure container images are up-to-date with available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/?utm_source=readmes) attesting to the provenance of all artifacts within the image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/?utm_source=readmes)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds?utm_source=readmes))

For cases where you need container images with shells and package managers to build or debug, most Chainguard Containers come paired with [a *development*, or `-dev`, variant](https://edu.chainguard.dev/chainguard/chainguard-images/about/differences-development-production/).

In all other cases, including Chainguard Containers tagged as `:latest` or with a specific version number, the container images include only an open-source application and its runtime dependencies. These minimal container images typically do not contain a shell or package manager.

Although the `-dev` container image variants have similar security features as their more minimal versions, they include additional software that is typically not necessary in production environments. We recommend using multi-stage builds to copy artifacts from the `-dev` variant into a more minimal production image.

## Need additional packages?

To improve security, Chainguard Containers include only essential dependencies. Need more packages? Chainguard customers can use [Custom Assembly](https://edu.chainguard.dev/chainguard/chainguard-images/features/ca-docs/custom-assembly/) to add packages, either through the Console, `chainctl`, or API.

To use Custom Assembly in the Chainguard Console: navigate to the image you'd like to customize in [your Organization's list of images](https://console.chainguard.dev/images/organization), and click on the **Customize image** button at the top of the page.

## Learn More

Refer to our Chainguard Containers documentation on [Chainguard Academy](https://edu.chainguard.dev/?utm_source=readmes). Chainguard also offers [VMs](https://www.chainguard.dev/vms?utm_source=readmes) and [Libraries](https://www.chainguard.dev/libraries?utm_source=readmes) — [contact us](https://www.chainguard.dev/contact?utm_source=readmes) for access.
 

## Trademarks

_This software listing is packaged by Chainguard. The trademarks set forth in this offering are owned by their respective companies, and use of them does not imply any affiliation, sponsorship, or endorsement by such companies._