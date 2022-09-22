# go

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/go/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/go/actions/workflows/release.yaml)

Container image for building Go applications.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/go:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1` `1.19` `1.19.1` `1.19.1-r0` `latest` | `sha256:b7a3d02639057ae0d796875be99d9ece286dd55aa5d6bb3fd30e19b69643941a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b7a3d02639057ae0d796875be99d9ece286dd55aa5d6bb3fd30e19b69643941a) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.1-r0-glibc` | `sha256:a8950df74556b8abd85c3e6f8085ba250ca8f35d47dad80ab577962303d74622`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a8950df74556b8abd85c3e6f8085ba250ca8f35d47dad80ab577962303d74622) | `amd64` |


## Usage

## Host architecture example

To build the Go application in [examples/hello/main.go](examples/hello/main.go)
using the host architecture:

```
docker run --rm -v "${PWD}:/work" -w /work/examples/hello \
    -e GOOS="$(go env GOOS)" -e GOARCH="$(go env GOARCH)" \
    cgr.dev/chainguard/go build -o /work/hello .
```

The example application will be built to `./hello`:
```
$ ./hello
Hello World!
```

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

## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/go:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/go:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/go"
      },
      "image": {
        "docker-manifest-digest": "sha256:b7a3d02639057ae0d796875be99d9ece286dd55aa5d6bb3fd30e19b69643941a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "5bbd1aeb85b2bed86362cfa3414bc56d64ea4677",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/go",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCSEko+iLPFf78faEMvDC3i59xmsbekGu+NxLjuQXpzUAIhAMkZvegjocr/UmdUaZZhAbODbZ1MZMEKNN0sSpz9Uj7z",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjZjVlMmMyNjgyMGI0MzhlNmJkYjc2OThhNjE0Zjg4OThjMmJjNjBmZGIxYmQzM2ZmOGY2N2RmMjA5ZmU0NjFkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJR0FwN2UrMmZZNE04SkVJV0tsNWlGb0FmNDNzSStwelZQQ3N2MzJIUFlZVUFpRUE5RHNzT0lzanhwZkdyRjRNdkJIeGxrdGg0aW10WitLVllDeTlRaUFOY09zPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZla05EUVhseFowRjNTVUpCWjBsVlN6TnNka3B1YjA5T1F5OWphbGRpUzNoemRtWlRWRWhWVjBGTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hsTlJFbDZUV3BOZUZkb1kwNU5ha2wzVDFSSmVVMUVTVEJOYWsxNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZwUkhabU1IVTJhblVyUzNKRlNqbHRkMVZMTm0xS1UxQkdhblpQT0VGdkszUXZRVFVLWlRaU1VuTnlSblZ1YjBKUmFtNWtaR1JoY0RaMlFYQlZUa0o2WTJWMFlUQnFVVUpLWTFvMFN6QmFUMlpwT0hOdlRtRlBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZDUm00MUNscE5WbEZxVG10dVdFOXZXRkZYYjNWaVMyWXlUaTlCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlYwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FXaDZXVEpvYkZwSVZuTmFWRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJjeFdXMUthMDFYUm14WmFtY3hXV3BLYVZwWFVUUk9hazB5VFcxT2JWbFVUVEJOVkZKcFdYcFZNbHBFV1RCYVYwVXdDazVxWXpOTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5KUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUmtkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZUREprZGsxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sM1dVdExkMWxDUWtGSVYyVlJTVVZCWjFJNVFraHpRV1ZSUWpOQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNaekpOUzBoM1VVRkJRVkZFUVVWbmQxSm5TV2hCVGxaME1EQlRSRTFNTkV4QlZWcDZTbGhyYVZBMldYRUtXbmRWZUV0RmFFaG5kRmRRV0cxWmFXb3hjemhCYVVWQmF6aGxkM2d5ZHpWUE5sSnlNRFUyVjBOM09EZ3hMMGhQTm5Sek0zZGFVSEZKZDJsQlFsWlBVd3AyTmxsM1EyZFpTVXR2V2tsNmFqQkZRWGROUkZwM1FYZGFRVWwzWVZGVldIaHNNSGNyT0dKQ1UwZDBkVVpWUnpWMlRFZFFkbWx6TTIwelpVcHBhamxwQ2tsUFNHZzVLM0FyWVhZM2JIcHFPVFpqVVRkRFEyRm9lV1l5SzJOQmFrSkRkRVF3UmtJcmJUY3lURGhSVlRsSWFFZ3lRV0phWjBkUVppdFVaMlIwYmtnS1JrRm9XbVJvT0haUlJ6VnZORmswUjBrMWFHZ3ZUbVExUVVsVlZuSlFZejBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663813990,
          "logIndex": 3716232,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/go/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3102450246",
      "sha": "5bbd1aeb85b2bed86362cfa3414bc56d64ea4677"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

