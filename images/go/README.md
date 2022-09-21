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
| `1` `1.19` `1.19.1` `1.19.1-r0` `latest` | `sha256:95bb9b3408d1df31a4263ecbb1dd729e87c44dbce39987fa49e0b746590be225`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:95bb9b3408d1df31a4263ecbb1dd729e87c44dbce39987fa49e0b746590be225) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.1-r0-glibc` | `sha256:9a7fd0a2e45a03766c0c1f2b829b90e1304ec7c38ef6f2ff35dc0e0b7b1b56e7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9a7fd0a2e45a03766c0c1f2b829b90e1304ec7c38ef6f2ff35dc0e0b7b1b56e7) | `amd64` |


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
    fmt.Println("Hello Distroless!")
}
EOF
RUN go build -o hello .

FROM cgr.dev/chainguard/static:latest

COPY --from=build /work/hello /hello
CMD ["/hello"]
```

Run the following command to build the demo image and tag it as `go-distroless`:

```shell
docker build -t go-distroless  .
```

Now you can run the image with:

```shell
docker run go-distroless
```

You should get output like this:

```
Hello Distroless!
```

It’s worth noting how small the resulting image is:

```shell
docker images go-distroless
```

```
REPOSITORY      TAG       IMAGE ID       CREATED          SIZE
go-distroless   latest    859fedabd532   26 minutes ago   3.21MB
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
        "docker-manifest-digest": "sha256:95bb9b3408d1df31a4263ecbb1dd729e87c44dbce39987fa49e0b746590be225"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "536292ab360ae07df4b1ae46338d9ec0db7b50a8",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/go",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCE1NXmh3dHCJCspbDkKvlKi2afv5IgeYvCJBldFRrvCwIhAJ/YmngXwlx5xJ94PIWkGZP6jQcsxplVURnEznge6wL4",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwOWE3ZWY3Y2UzYzdlNTljMjBmY2QwNzQxMTMxZTVmNjI1NjNlOTBmZGIxZjIxYmMzZjhmZmQ3NGI1NDE3YjMyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURPWkd5V1l3QjNINkp3enJiQkQ1VnNUc29jQ1NnQjg2TkhsZXY3RFhFdFBRSWdRc0FPeDYrSDB6Qmw5OTRMMWFpWUt3cHB1TStzRS9iNmZ5QUh6dUFkclQwPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVla05EUVhsWFowRjNTVUpCWjBsVldHOHdiQzlWU0dJeU5tSTNUVXcwUjBOQ2VHdFRRVEpKSzNwSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hoTlZGbDZUa1JCZDFkb1kwNU5ha2wzVDFSSmVFMVVXVEJPUkVGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZOWTBZeWJIaEpjWE5aYkhKTlIyWlJObXBEVlZsUlltTTVUVFkwYkhVd2VWazJVVXdLTVRWVVRIWTNXSGM1U3pneFNTOTBiWEJrTW5GdU9UbGhWek52V0ZkR2RtVm5SM0ZxZVRSWmN6TkdaV1JsV1dOSk5tRlBRMEZyVVhkblowcEJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV4YkhveENrZFRSa3h3TmpFNWJYbzVhVlk1V21kVFEzaHRZVFZOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlUwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FWSjNaRmhPYjAxRVdVZERhWE5IUVZGUlFncG5OemgzUVZGTlJVdEVWWHBPYWtrMVRXMUdhVTE2V1hkWlYxVjNUakpTYlU1SFNYaFpWMVV3VG1wTmVrOUhVVFZhVjAxM1drZEpNMWxxVlhkWlZHZDNDa2hCV1V0TGQxbENRa0ZIUkhaNlFVSkNRVkZQVVROS2JGbFlVbXhKUmtwc1lrZFdhR015VlhkSloxbExTM2RaUWtKQlIwUjJla0ZDUWxGUlZWa3lhR2dLWVZjMWJtUlhSbmxhUXpGd1lsZEdibHBZVFhaYU1qaDNTRkZaUzB0M1dVSkNRVWRFZG5wQlFrSm5VVkJqYlZadFkzazViMXBYUm10amVUbDBXVmRzZFFwTlNVZExRbWR2Y2tKblJVVkJaRm8xUVdkUlEwSklkMFZsWjBJMFFVaFpRVU5IUTFNNFEyaFRMekpvUmpCa1JuSktORk5qVWxkaldYSkNXVGwzZW1wVENtSmxZVGhKWjFreVlqTkpRVUZCUjBSWlQxbHhkMmRCUVVKQlRVRlNla0pHUVdsRlFUUkZlRWRZT0dsTE1rTnRaMWx2WVc5d1YyTm5aMGd3UkRWMVZXWUtPRmxQYW1ack9VcGFTVk5LZW5GSlEwbEdhMFJ6ZFhwMlZTOWljMGN4YVdNelkwSjVOR3RZTWs1QmJDdHFlV1ZyYURsRVNHRXdWREJHZGtSalRVRnZSd3BEUTNGSFUwMDBPVUpCVFVSQk1tZEJUVWRWUTAxRWNHY3pXVzF3TUZOcVEzQkxVelIwUzBkYVZrRTBjMHBMVDNCMlJ6SXdVRWhsTXl0TWRHdHpiRFZxQ25jdllTdElkMlkzZVZrNU9VUmhXbUpaVnpKVVozZEplRUZQWW05d01rOWFNRkpMVW5BMmJEaHNiMlpqVGxSV05HcHVSREZ5Y20xU1FrazNUWEpqUkRZS1lrdzVkakpHTVRac01XWnFiMDVEVDBSUVdIaHlhV1pIT1hjOVBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1663778065,
          "logIndex": 3687155,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/go/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3099437369",
      "sha": "536292ab360ae07df4b1ae46338d9ec0db7b50a8"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

