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
| `1` `1.19` `1.19.2` `1.19.2-r0` `latest` | `sha256:d78c4ecacc4539013fbef48ef79655afc84fab66bbf0bfabc002b2f1a57ad20b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d78c4ecacc4539013fbef48ef79655afc84fab66bbf0bfabc002b2f1a57ad20b) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.1-r0` | `sha256:38adede21243fda456da1a69eaaa0e2291c145dd9ab648332a5a932c0bc61490`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:38adede21243fda456da1a69eaaa0e2291c145dd9ab648332a5a932c0bc61490) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.1` `1.19.1-r2` | `sha256:ec841359408345c28596a5765253da3870c8364d010cfd55455f6f31e129faf2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ec841359408345c28596a5765253da3870c8364d010cfd55455f6f31e129faf2) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.1-r0-glibc` | `sha256:4b23328613ccf9b514c0f4592a26029172265bc372da2549730bea8ecf4d5da4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4b23328613ccf9b514c0f4592a26029172265bc372da2549730bea8ecf4d5da4) | `amd64` |
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
        "docker-manifest-digest": "sha256:d78c4ecacc4539013fbef48ef79655afc84fab66bbf0bfabc002b2f1a57ad20b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "9334bfe14f76d720ac4ae0fd8c68b3ed6c2cf772",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/go",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDelTEEuH93E4a31r7IhRDbpAAMkRGvOH3NKvDB1pASqgIhAORCj3xw3nfYq75rmrTcUfUeFMjlb1eiYQIKYRRCT4t6",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5MTI1ZDU4NDY1Y2Y0MGIwNDcyOTBiOTEyNTMxMjc3Njg2ODc5OGNiMGZkNDUyODMxZjJjNmMwMjg3ZGYxNmU0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJSGEyTEs3VXdaTmRMMkhoRXRzcnc5SEV6ZHErUmRNU0xHK2lKdEgzdDdXWUFpRUFrYlBhdnkxZG9ZQjJoeUV4UURER0xreVZNNlJLdWZmU05pQjVBUUN5OHBjPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZla05EUVhseFowRjNTVUpCWjBsVlNqVm1Xak5YVjNOVlkxWnJiQzgxVDNabFZuaE9LekIwZFZJd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RGTlJFa3hUbXBWTkZkb1kwNU5ha2w0VFVSSk1VMUVUWGRPYWxVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUzV0dzMlFUWnhiVTlOVDJOaVRuUmhiM2g2VHl0MmVUVk9aRXRuYlc5TlVscHZZM01LWm5STU1uRm1jbkFyYkRaS1RXbE9kalJMZEdKNlFVMUhUMVJQUVdJeFVsUjFPWGxEVUZoVWIwWXZlVTVPTWtOclVYRlBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV6TTAwMUNtNU5Samx3Y0hFNFNHMDBjVE40ZG5sSk1tWnhWMjFKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlYwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FXaDZXVEpvYkZwSVZuTmFWRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJjMVRYcE5NRmx0V214TlZGSnRUbnBhYTA1NlNYZFpWMDB3V1ZkVmQxcHRVVFJaZWxrMFdXcE9iRnBFV21wTmJVNXRDazU2WTNsTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5KUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUmtkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZUREprZGsxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sM1dVdExkMWxDUWtGSVYyVlJTVVZCWjFJNVFraHpRV1ZSUWpOQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNhRUV3VTFoVFJVRkJRVkZFUVVWbmQxSm5TV2hCVFRBM05XUkZZMU5QVFZoV05IbDNjbXBZY2k5TE5VSUthMXA1Wkc1bWMyUjZUREZpVDAxWmJ6SkdPVmxCYVVWQmVGVmliR1JPWVZaV05XUTVjbnA2UTBsWFdYTkdhREZHU2xSVk1YTmtkM1YwYnpGYVVpczJiZ3B0TUUxM1EyZFpTVXR2V2tsNmFqQkZRWGROUkZwM1FYZGFRVWwzVjA1dVZVNDFVblJvVVhoT1QyUnlOblZ4Tkc5NE9EVXlPRm8xVTNJck9IaFpaVVphQ2tkVGFEWnJWbGxqUjFOSUwxTkVhMWxyYVhoMVZEY3dNVkZrVmpkQmFrSjFXak0wVmtGcWFIaExiRk51WmxGUGMwNUlNWE50YXpocGJuRmlSRTFUWldFS2NtVnZjRWR1Tms1UEwzSnpXVXQyTDFSNGJGUTBhRmRHWVVSemJXaHNUVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1666666638,
          "logIndex": 5807703,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/go/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/go",
      "githubWorkflowSha": "9334bfe14f76d720ac4ae0fd8c68b3ed6c2cf772",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3317759057",
      "sha": "9334bfe14f76d720ac4ae0fd8c68b3ed6c2cf772"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

