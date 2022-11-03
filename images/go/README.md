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
| `1` `1.19` `1.19.3` `1.19.3-r0` `latest` | `sha256:2ccb5af29fa468a1188fd35a78013fc48fefcc7d1d9f302b8de5da26bda24606`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2ccb5af29fa468a1188fd35a78013fc48fefcc7d1d9f302b8de5da26bda24606) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.1-r0` | `sha256:38adede21243fda456da1a69eaaa0e2291c145dd9ab648332a5a932c0bc61490`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:38adede21243fda456da1a69eaaa0e2291c145dd9ab648332a5a932c0bc61490) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.1` `1.19.1-r2` | `sha256:ec841359408345c28596a5765253da3870c8364d010cfd55455f6f31e129faf2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ec841359408345c28596a5765253da3870c8364d010cfd55455f6f31e129faf2) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.1-r0-glibc` | `sha256:afffa26dd6dbd8d52ba0e01c1ce1224fc39d25ae19980cd24ea2263ce6947369`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:afffa26dd6dbd8d52ba0e01c1ce1224fc39d25ae19980cd24ea2263ce6947369) | `amd64` |
| `1.19.1-r1` | `sha256:fc6136ed867b98663f6cd5388805eae81bd21de20944b4fe4a4b6748673d36cf`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fc6136ed867b98663f6cd5388805eae81bd21de20944b4fe4a4b6748673d36cf) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.2` `1.19.2-r0` | `sha256:3f7206a2cfbf680b63f71188cd76c7597d35720a0a9a6c95fc5c9556ba74e332`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3f7206a2cfbf680b63f71188cd76c7597d35720a0a9a6c95fc5c9556ba74e332) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.3-r0-glibc` | `sha256:72ed12acea4b4f435c71054ccd77a97897df92f14a2a7d91c1826a362328aca3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:72ed12acea4b4f435c71054ccd77a97897df92f14a2a7d91c1826a362328aca3) | `amd64` |


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
        "docker-manifest-digest": "sha256:2ccb5af29fa468a1188fd35a78013fc48fefcc7d1d9f302b8de5da26bda24606"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "fca3cd620c6a4f5366e3cd79c538fb6f15973255",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/go",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCYEjbt63UrGeRV2UlDdwCICAEy2l+w8UV5ewAp7fzZFQIgJaaIRkA40i88zFHh/MTLvvsal9RWWTAm0VuHjyummUg=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0OGU4Y2NjNjkxZjYzYTM0NWU5NGFjZTliMDA5NzdlMzhmOTQzOGYyM2Y5ZjhmMzFjZjY0NTk1Mjg4Y2FlYzYwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQXJ6aWNlM0Y2clhhZ1paUUFBVHlpV292Nk5ncUN4T0kwNUdhd0hueUJ4WUFpRUE4Y0Q4TWdSdVFEQUJMMy9TNm0xQ2kxWGlqOHNnUjJsOEorNHdOOVdLQnYwPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZSRU5EUVhsaFowRjNTVUpCWjBsVlUzSkhUalJ2VlhkV2IyVkpSMWhGYVhaeGMxQmxOMDF0UkRJd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhwTlZHTXhUMVJSZUZkb1kwNU5ha2w0VFZSQmVrMVVaM2RQVkZGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZRV0dwNlZVSjZlRmswWVhjeVZXSlFTR2R4VGxGWlptWlhSbU1yYnpOc1ZqQkJUMElLZDB0clpVeDBkSGRTYUVzM2RIUkVhSEoyTWtKamVtdFRkRmxVU1dwNWRFcFBZMjFJZWxneWFGQnpiM2hTVlhvd1RUWlBRMEZyVlhkblowcENUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZzSzNBd0NuVmtaRXgzTWxCV1YwZHZURmRXY2s1dWMzUkxia2RyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlUwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FWSjNaRmhPYjAxRVdVZERhWE5IUVZGUlFncG5OemgzUVZGTlJVdEhXbXBaVkU1cVdrUlplVTFIVFRKWlZGSnRUbFJOTWs1dFZYcFpNbEV6VDFkTk1VMTZhRzFaYWxwdFRWUlZOVTU2VFhsT1ZGVjNDa2hCV1V0TGQxbENRa0ZIUkhaNlFVSkNRVkZQVVROS2JGbFlVbXhKUmtwc1lrZFdhR015VlhkSloxbExTM2RaUWtKQlIwUjJla0ZDUWxGUlZWa3lhR2dLWVZjMWJtUlhSbmxhUXpGd1lsZEdibHBZVFhaYU1qaDNTRkZaUzB0M1dVSkNRVWRFZG5wQlFrSm5VVkJqYlZadFkzazViMXBYUm10amVUbDBXVmRzZFFwTlNVZE1RbWR2Y2tKblJVVkJaRm8xUVdkUlEwSklNRVZsZDBJMVFVaGpRVE5VTUhkaGMySklSVlJLYWtkU05HTnRWMk16UVhGS1MxaHlhbVZRU3pNdkNtZzBjSGxuUXpod04yODBRVUZCUjBWUWNWbFJVMUZCUVVKQlRVRlRSRUpIUVdsRlFUbFhVVVZLYVRsc1RHaFBWVEl3VVRGb2FISndTRWgzTlRoclFuRUtVV051Y1ZwNk0yZ3dkM1Y1TVZWTlEwbFJRMWczY1hCa04yMTVabkpZYkZONkswcHZaR2xDUVRSb1lYRTRTblJHUzJ4amEyd3hRMGt3TVZGQldrUkJTd3BDWjJkeGFHdHFUMUJSVVVSQmQwNXZRVVJDYkVGcVFucFJaRXhySzFSRFNISlBjekJ2VlRnMmNrUlRWakpRTkN0VGNTOXRlakpQUVZnemNHRjNVMUUwQ2pnMmFUbFJOVGRwTUROWlFtSndXRkIyUlRSdk1FcDNRMDFSUkRGeUwxWkhPR3BMTkd0S1JWUTRkSFJ5YzJwNlUwdDJla1pRU25GSlF6STNiRkJFZURRS016QjVVbk54YjFoRmNHMWFZbXhXUlU5VlNrczNkMUpuUms5WlBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1667498416,
          "logIndex": 6438503,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/go/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/go",
      "githubWorkflowSha": "fca3cd620c6a4f5366e3cd79c538fb6f15973255",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3388088768",
      "sha": "fca3cd620c6a4f5366e3cd79c538fb6f15973255"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

