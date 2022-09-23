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
| `1` `1.19` `1.19.1` `1.19.1-r0` `latest` | `sha256:de1d6cb284f6ddbd71bc884992ff753bcdacde491f377cc87be7d26faa883532`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:de1d6cb284f6ddbd71bc884992ff753bcdacde491f377cc87be7d26faa883532) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.1-r0-glibc` | `sha256:6a7a16ebe64b594a3a0c06c8865c44384e9b544608f0ee9175340e2e46f5af6a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6a7a16ebe64b594a3a0c06c8865c44384e9b544608f0ee9175340e2e46f5af6a) | `amd64` |


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
        "docker-manifest-digest": "sha256:de1d6cb284f6ddbd71bc884992ff753bcdacde491f377cc87be7d26faa883532"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "57fee34dae9c4e5725dd6a71d5eab251841b2286",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/go",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCOdM28nPzZGR5oEL9li/TQbZ3N89PvQjRpIrsnIwKVpAIgI2u/poajlI/L/ruE5zKetAwFXF7U6WRKk0EFEyYV7zg=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4Y2YzZGFjMzIyNjk3ZTJhZjUzMzMzYmJiNDM3NWNhODU5ODQyMWE2NjJjNDExZTJmYWU0NWNkMTU1OWJjMmE1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURjSGxPb3BERUNla3FLYURBMTZsRTg1TTZBSUtCWFE1M05ZYVNTOGtPdUJRSWhBSm5qWE02SVBja21XUDVIWVNuc0swSGhzRzZlOW5sV25HZHFFa1Fmb2RiTiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhseFowRjNTVUpCWjBsVlZubEdaa2R6UmxRNWQxaHlNM0pwYVN0NGQwRnJiMGREYm5KSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hwTlJFbDZUbXBWZWxkb1kwNU5ha2wzVDFSSmVrMUVTVEJPYWxWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY2Y0RCSE4yeGpTSEJMVEM4NE0wZG5ZVXhoV0dOUWVYTnhiMVJUVm5RM2J6WnJZVThLU1VKS1kwbHRaU3R5TkhWMFUwVXpSaTlRWW5ORmVFb3JXSEZ5V2l0NE1GTXplRXBPUlRSb1NtTnZOa1oxYTJab2RHRlBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZwTVVOc0NsZzNaMkZ2VmtaSlUxZFRiakYyWmpjMFozWlBVRlpCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlYwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FXaDZXVEpvYkZwSVZuTmFWRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJjeFRqSmFiRnBVVFRCYVIwWnNUMWROTUZwVVZUTk5hbFpyV2tSYWFFNTZSbXRPVjFab1dXcEpNVTFVWnpCTlYwbDVDazFxWnpKTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5KUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUmtkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZUREprZGsxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sM1dVdExkMWxDUWtGSVYyVlJTVVZCWjFJNVFraHpRV1ZSUWpOQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNaekpuTUdWck5FRkJRVkZFUVVWbmQxSm5TV2hCVEZSdFNXSkhialptYzJOdmRGSkxVRnBHUkhJeFdITUthMmRNWWxoSVVIWlpZaTl5TVRWNVVEQlZaazlCYVVWQk9UQnBWRXhoUlZCRGMyUlRNSFoyWTJVMGJVNDJaMUUxVGtKUldrWnVXRTlSUTBzd1l6ZDZXUXBDYVZsM1EyZFpTVXR2V2tsNmFqQkZRWGROUkdGQlFYZGFVVWw0UVZCdFJsTjRaRmhyZWpkNGNWRk1jRU14YTBGVVZVcGpZblk1UW5GU1VrdzNlWFZFQ2xaTFJ6RmtNVzVGUkdJcllWSTVSMVkzT1VWT2VXSnRkRlZsYUVjMlVVbDNXSGRqTnk5WE1IRktWM2czVUNzdllrNXZha2xEYmtKSFdHOUJLMU13VTJVS1psbEplVUkyVkRGSE9VTm9lREZETkVnelJsaHhaRTVWYUdjelUxQmxhVmdLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663900632,
          "logIndex": 3783759,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/go/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3110037230",
      "sha": "57fee34dae9c4e5725dd6a71d5eab251841b2286"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

