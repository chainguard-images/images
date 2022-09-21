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
| `1` `1.19` `1.19.1` `1.19.1-r0` `latest` | `sha256:89db43095063684819bf0ff4af5a5488e4f6634aa6cbf6244b67af5310d1d9c7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:89db43095063684819bf0ff4af5a5488e4f6634aa6cbf6244b67af5310d1d9c7) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.1-r0-glibc` | `sha256:205c39423158682fdbdbcb9175bf62545c43fbef0f062b4efe27abd2f4ad5bb0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:205c39423158682fdbdbcb9175bf62545c43fbef0f062b4efe27abd2f4ad5bb0) | `amd64` |


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
        "docker-manifest-digest": "sha256:89db43095063684819bf0ff4af5a5488e4f6634aa6cbf6244b67af5310d1d9c7"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "a907936cb2590b56d1f330c794513d8bef6db2c4",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/go",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIHOihQACYHZ1Wm5W+/zYSLaoqiRYa+jILIotnEyzwjFBAiAKZvwGNEQMI2YLD+1N44sj/hC1+RsWaDLHk3ENyMPTVQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyYWY2MDgwOTA1YTUzY2JhMDAzYzAzNmFlNjNkNjc3Njc0MjQ4MzRhMDRlNmJkNDc0MWNiOTlmY2Y0YjA4NjM3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRzdVUXhKVGxNb1dONTgxdUlZc3EreStHYXpaQlNDRHJtbndXTi8xd28vVEFpRUFzQ0NUVzArSVZVQTNCcTd4Wjc4ayt1UzBDRHVZa0lOMkpsQkNQMCs4NXRnPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVla05EUVhsaFowRjNTVUpCWjBsVlNUQmlOeXRzTmtNd2QzZDVjelZUU1RCM1VXNVJRaXRRZUcxM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hoTlZHTXhUbnBCTkZkb1kwNU5ha2wzVDFSSmVFMVVaM2RPZWtFMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV4VUhwUlVHUlNRamhKYjJFNWJrSklURzV6TW5STFVVSXJibmQ1YVVSTmJFWkRlRzBLYmxnM0x6aHZjR2h6V1dwUlFqVlpUemxaY0ZOaldqQjFlVlZzWVRGdE1FaFlZbmRQVEZFMGJrVmtUM0V6ZG1wUWJXRlBRMEZyVlhkblowcENUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZsZHpGMUNqWnZaSEpTVkdobE9IaHRhVkUwZWxrdkt6VmllVFZCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlUwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FWSjNaRmhPYjAxRVdVZERhWE5IUVZGUlFncG5OemgzUVZGTlJVdEhSVFZOUkdNMVRYcGFhbGxxU1RGUFZFSnBUbFJhYTAxWFdYcE5la0pxVG5wck1FNVVSWHBhUkdocFdsZFpNbHBIU1hsWmVsRjNDa2hCV1V0TGQxbENRa0ZIUkhaNlFVSkNRVkZQVVROS2JGbFlVbXhKUmtwc1lrZFdhR015VlhkSloxbExTM2RaUWtKQlIwUjJla0ZDUWxGUlZWa3lhR2dLWVZjMWJtUlhSbmxhUXpGd1lsZEdibHBZVFhaYU1qaDNTRkZaUzB0M1dVSkNRVWRFZG5wQlFrSm5VVkJqYlZadFkzazViMXBYUm10amVUbDBXVmRzZFFwTlNVZE1RbWR2Y2tKblJVVkJaRm8xUVdkUlEwSklNRVZsZDBJMVFVaGpRVU5IUTFNNFEyaFRMekpvUmpCa1JuSktORk5qVWxkaldYSkNXVGwzZW1wVENtSmxZVGhKWjFreVlqTkpRVUZCUjBSWlZFcElNMUZCUVVKQlRVRlRSRUpIUVdsRlFYbHBNM2wyWTJaU1RrTlBWMWRZU3pOaUwwZzNSbGxZVlhaeFREWUtPSGRxY2s5elNFNDBlakpqZUdOelEwbFJSRkpqYW5SQ1dVZ3ZWM2N6ZEVoaE5qRnNkalJuVUdFdlNGRkhkMlZ3WTBreU1uUlVNMm95Y1c1WFptcEJTd3BDWjJkeGFHdHFUMUJSVVVSQmQwNXVRVVJDYTBGcVFqRkpiMmxzVERSd1dETkxVWFZuWjBwQ1pqRTRjR0p0U1hFMk16TXJRMDFMZW5WQ2VHczFZbGw1Q25CQ0wyeE1SRFZSTUdwd1dpdDRPR2d4ZGs1RWVVSkpRMDFEV205V1pHaHNVU3R3TlhKcVoxZFFOamRPVFhGc1EwOWplblkxTVhRd1IxWnRNRzh6ZVdvS2J5dHdkWGxLTm5rMFNYQTBSMGt5V1daSWJXdEJNbVFyYjFFOVBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1663783051,
          "logIndex": 3691112,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/go/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3099978530",
      "sha": "a907936cb2590b56d1f330c794513d8bef6db2c4"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

