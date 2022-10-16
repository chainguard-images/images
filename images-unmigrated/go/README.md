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
| `1.19.1-r1` | `sha256:fc6136ed867b98663f6cd5388805eae81bd21de20944b4fe4a4b6748673d36cf`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fc6136ed867b98663f6cd5388805eae81bd21de20944b4fe4a4b6748673d36cf) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1` `1.19` `1.19.2` `1.19.2-r0` `latest` | `sha256:7804824937d0b277ed507cc048b8fadb99faa064091c3cf5fe6e947049fa4db7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7804824937d0b277ed507cc048b8fadb99faa064091c3cf5fe6e947049fa4db7) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.1-r0` | `sha256:38adede21243fda456da1a69eaaa0e2291c145dd9ab648332a5a932c0bc61490`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:38adede21243fda456da1a69eaaa0e2291c145dd9ab648332a5a932c0bc61490) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.1` `1.19.1-r2` | `sha256:ec841359408345c28596a5765253da3870c8364d010cfd55455f6f31e129faf2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ec841359408345c28596a5765253da3870c8364d010cfd55455f6f31e129faf2) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.1-r0-glibc` | `sha256:f3eea8fbde8e3ba98eb1da6cdceae61ae4d67bf95ff1411a9497f4a597c5326f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f3eea8fbde8e3ba98eb1da6cdceae61ae4d67bf95ff1411a9497f4a597c5326f) | `amd64` |


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
        "docker-manifest-digest": "sha256:7804824937d0b277ed507cc048b8fadb99faa064091c3cf5fe6e947049fa4db7"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "f39227aaa34d5810cd5cc8d67fa3682920725784",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/go",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCTDwXfELKUp5DKnf+6krNjE82PL3l9iylz08HSqeQ39wIgbkDInw68AxtbTFM6ca7QhLqekunkD1dXUUEjqWj8YYw=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2NDhlZTc5ZDUxM2NkZjFiZjZhNTcyOWUyNWE3MWRmMzc3MTY3NGQ5ZDY3Y2E5NDBjOGIzNmNlNjQ3ZWNhNmVlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNjTjZDRndUelJvbW1aM0xoZEJ1MzdBMTdrZDh5TU01dGd6bUhYamF5YXdRSWdKU2t4YzM1MG9qU0dVUkJhR1Q3dVErcjBHU3B2SDkwY3dnWHlNRlJEUmtBPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZWRU5EUVhscFowRjNTVUpCWjBsVlZtMXhjbHBJU1dwWVltOXZlSEpQTld4TmRGUmthREkzY0VKcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRKTlJFa3dUbFJOTTFkb1kwNU5ha2w0VFVSRk1rMUVTVEZPVkUwelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZMUzFkNVQwb3pkV3d6VURSUlRYRTBORTlDTW5VMlpXWjRNM0ZWVjAxeWVIWkNNV2NLYW0xQ09VZHpSMk5hTmpSMVJsTnNaRGd3S3pFcmFFc3dRbTFsT0RrM1ZESkZjbE5LWm1KNk1UTjFURm94V1ZNNVRFdFBRMEZyWTNkblowcEVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZEUkhwdENtMTFTa0ZXVG1Rck9GQkZZemg1UVhoMVQwWTVTVkl3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlYwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FXaDZXVEpvYkZwSVZuTmFWRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJodFRYcHJlVTFxWkdoWlYwVjZUa2RSTVU5RVJYZFpNbEV4V1RKTk5GcEVXVE5hYlVWNlRtcG5lVTlVU1hkT2Vra3hDazU2WnpCTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5KUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUmtkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZUREprZGsxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sUldVdExkMWxDUWtGSVYyVlJTVVZCWjFJM1FraHJRV1IzUWpGQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNaemsyZFhaVlZVRkJRVkZFUVVWWmQxSkJTV2RMV0hkblNFbElSVTVxV1VKdmJYQkdiR2xDWm5sbFJXb0tXWFJzVGtwTGNGbGhOazFRTjNCNWFGRjVVVU5KUVN0emFFSk9RbGh0TWpsQ2VtaERNRzVqV2xWd2NXaE1kRFYwVEZkNk16VkZXR3cxVmtsQ01pOU9ad3BOUVc5SFEwTnhSMU5OTkRsQ1FVMUVRVEpqUVUxSFVVTk5SR294VmxvNFVEbDNTMWx3WkN0d1FrTlhWWFZzZUhKMVdrazVXbW94V2tKa00wSk5WbkJsQ25JM2NrRjBXRzExY0VObVdXNVBhRmRxZDNGRU5qVXpjakZuU1hkWlFsRkhNVGh6VFhoeE4yVnhVMmhuVEhCRE1YcEtRV056ZFRCdGIzSnpLM2hrWjBRS1NEbHNkMFZMWm1Zck0wRjJjemczYWpsVGRYWlFlR293YmxSWFZBb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1665888359,
          "logIndex": 5191640,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/go/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/go",
      "githubWorkflowSha": "f39227aaa34d5810cd5cc8d67fa3682920725784",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3257989420",
      "sha": "f39227aaa34d5810cd5cc8d67fa3682920725784"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

