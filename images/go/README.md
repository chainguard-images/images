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
| `1` `1.19` `1.19.2` `1.19.2-r0` `latest` | `sha256:1cb14d9f908c7b03389830a4879f741ecaea5b0f112a7aa0fd6da936f05b31f9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1cb14d9f908c7b03389830a4879f741ecaea5b0f112a7aa0fd6da936f05b31f9) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.1-r0` | `sha256:38adede21243fda456da1a69eaaa0e2291c145dd9ab648332a5a932c0bc61490`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:38adede21243fda456da1a69eaaa0e2291c145dd9ab648332a5a932c0bc61490) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.1` `1.19.1-r2` | `sha256:ec841359408345c28596a5765253da3870c8364d010cfd55455f6f31e129faf2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ec841359408345c28596a5765253da3870c8364d010cfd55455f6f31e129faf2) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.1-r0-glibc` | `sha256:5e7e08f7ed1eb9a214bb5ac2680eb7c2a0ad741f6d8827e384396b7fd7787ef3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5e7e08f7ed1eb9a214bb5ac2680eb7c2a0ad741f6d8827e384396b7fd7787ef3) | `amd64` |
| `1.19.1-r1` | `sha256:fc6136ed867b98663f6cd5388805eae81bd21de20944b4fe4a4b6748673d36cf`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fc6136ed867b98663f6cd5388805eae81bd21de20944b4fe4a4b6748673d36cf) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:1cb14d9f908c7b03389830a4879f741ecaea5b0f112a7aa0fd6da936f05b31f9"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "f4ca71dfbb3c460f398bb4d801021215f1ce3f91",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/go",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDOiDYofb8vhxNfIU5pmc4pmVx8FB1+Zm0b4iVL3gQU0AIhAMmLO6RDPKzlQRdYv/MdHvK2j8Tlpb4Q2DGvTpJWDAwN",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhNzhjYzMwZGQyYTNiZjVlMmE5MTdkNTU1OGY1MzA5NjQwNzNhNWZhZTIwN2I0Mjg1ZDFmZmEzODBhMTQ3OTYzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURjOXRTSlVoc2xFUU83WDhodGI0MFEyTzhjTXBsa3VKbzZ1WS9yZVhld0VnSWdMNy9mVnZKTVcvTEdld2MvUkQ4dzFaN3Z4R2o1WGkxSUMwdUc5UnhPWGVJPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVha05EUVhsVFowRjNTVUpCWjBsVlNEWlhVRTVsU1daTGRHcGxkQ3QxTjNRM1kza3Zaa3BIYzJWVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlZHdDRUWHBKTTFkb1kwNU5ha2w0VFVSRmVrMVVhM2xOZWtrelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZtTkdGNlRXWkpPRE4wZGtwemFVeFRVMkpZY2xRd1RWVkpVMmx5V1dkWlYzTjFjakVLZG1SMlExTlZWVXN2YW5RcmIydEtOMmhvV2tKNFJtSjZiRXhTVlZoSVpFOUpjbk5EYkV0bmMwZ3JUVEpJU0VWc2VrdFBRMEZyVFhkblowa3ZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZZZFNzNENtNXhkbXRZYTFJdlZ5OXZhWHAxTTBseFZraEpaa3hWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlUwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FWSjNaRmhPYjAxRVdVZERhWE5IUVZGUlFncG5OemgzUVZGTlJVdEhXVEJaTWtVelRWZFNiVmx0U1hwWmVsRXlUVWRaZWs5VWFHbFphbEpyVDBSQmVFMUVTWGhOYWtVeFdtcEdhbHBVVG0xUFZFVjNDa2hCV1V0TGQxbENRa0ZIUkhaNlFVSkNRVkZQVVROS2JGbFlVbXhKUmtwc1lrZFdhR015VlhkSloxbExTM2RaUWtKQlIwUjJla0ZDUWxGUlZWa3lhR2dLWVZjMWJtUlhSbmxhUXpGd1lsZEdibHBZVFhaYU1qaDNTRkZaUzB0M1dVSkNRVWRFZG5wQlFrSm5VVkJqYlZadFkzazViMXBYUm10amVUbDBXVmRzZFFwTlNVZEtRbWR2Y2tKblJVVkJaRm8xUVdkUlEwSkljMFZsVVVJelFVaFZRVU5IUTFNNFEyaFRMekpvUmpCa1JuSktORk5qVWxkaldYSkNXVGwzZW1wVENtSmxZVGhKWjFreVlqTkpRVUZCUjBRd2MxRlBOMEZCUVVKQlRVRlNha0pGUVdsQ1VHOHdlWE55UmprclNHMW5ORGwzU1M5WmR5dDJXVXRuWm05VmFuVUtNWEJ1UlUxc0wyczNWMXAxTVhkSloyWlhPRkpOTUcxcmRsSm1LM0JIVDFwbE0ybFRkamhvVkZsWGVFVnFhMUk0Y0dNeFVucFBha3A0TTI5M1EyZFpTUXBMYjFwSmVtb3dSVUYzVFVSaFFVRjNXbEZKZDA4MFRtWmpPVEY1UkhwSlF6UkxTalEzU1VwSGRVaFFkMmxVZUU5emNGUm5PRkY1UlZwUVQyeEJXWGhsQ2tObWJrVm5TV3BNVVVwUGFrSmtkMUpXYVRrMlFXcEZRWFp1TTA1aWNHODFURFV3TWt3NVVVRTFiRk42ZG0xRGVtaDRUMXBXWkZCWVFsWjVjRlpUVFhjS0wyTTJZVE4wUkZKdWMwcEVSVFZMZEZCbVdXOHlNVTFoQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1665688432,
          "logIndex": 5045721,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/go/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/go",
      "githubWorkflowSha": "f4ca71dfbb3c460f398bb4d801021215f1ce3f91",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3245006470",
      "sha": "f4ca71dfbb3c460f398bb4d801021215f1ce3f91"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

