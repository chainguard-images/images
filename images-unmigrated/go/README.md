# go

[![CI status](https://github.com/chainguard-images/go/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/go/actions/workflows/release.yaml)

Container image for building Go applications.

**WARNING**

These images are currently being migrated to a new set-up. Pulling images from cgr.dev/chainguard/go will pull new Wolfi (glibc) based images, which do not match the images built from apko.yaml in this repository.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/go:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1` `1.19` `1.19.3` `1.19.3-r0` `latest` | `sha256:7fc0e7d27831d409344ce5aa9aca501c83a4e470651a90791dfb353229b6e556`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7fc0e7d27831d409344ce5aa9aca501c83a4e470651a90791dfb353229b6e556) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.1-r0` | `sha256:38adede21243fda456da1a69eaaa0e2291c145dd9ab648332a5a932c0bc61490`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:38adede21243fda456da1a69eaaa0e2291c145dd9ab648332a5a932c0bc61490) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.1` `1.19.1-r2` | `sha256:ec841359408345c28596a5765253da3870c8364d010cfd55455f6f31e129faf2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ec841359408345c28596a5765253da3870c8364d010cfd55455f6f31e129faf2) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.1-r0-glibc` | `sha256:afffa26dd6dbd8d52ba0e01c1ce1224fc39d25ae19980cd24ea2263ce6947369`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:afffa26dd6dbd8d52ba0e01c1ce1224fc39d25ae19980cd24ea2263ce6947369) | `amd64` |
| `1.19.1-r1` | `sha256:fc6136ed867b98663f6cd5388805eae81bd21de20944b4fe4a4b6748673d36cf`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fc6136ed867b98663f6cd5388805eae81bd21de20944b4fe4a4b6748673d36cf) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.2` `1.19.2-r0` | `sha256:3f7206a2cfbf680b63f71188cd76c7597d35720a0a9a6c95fc5c9556ba74e332`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3f7206a2cfbf680b63f71188cd76c7597d35720a0a9a6c95fc5c9556ba74e332) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.3-r0-glibc` | `sha256:314fe099fb4531637607b1133215ce5ac388deb461f1d0bc8035e90f3ad513a7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:314fe099fb4531637607b1133215ce5ac388deb461f1d0bc8035e90f3ad513a7) | `amd64` |


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
        "docker-manifest-digest": "sha256:7fc0e7d27831d409344ce5aa9aca501c83a4e470651a90791dfb353229b6e556"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "cf4e05666301b7b5f1f636a084076be7687faaad",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/go",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIEh9VVPKe/XfTqeUNiyNPKZPFBTZdKKLsPC+0vUANV+SAiEA8a3QDUMjejdTXYjV8LS4DuJWFLFhLLlZMR6LjKeE+f4=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0Y2E0NDA4OGI0YjBmNTY3MWQwOTJlMmI2MjcwYmIwY2UzOTY4YmRhYjc5ZGJlYjg1Yzk5YzcwNTkzY2VjMDYzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRHQ5UDh3aFhtdjdXaGRvUUpRN1Y3SzdNMFFvYWlOSndCRU1jTWZscFlDa0FpRUE4TmhUTTJVSXF6Kys4SlJuc1BaZGtuZlR0MC9KUjVva2RBZUFsRUtBRGRvPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhseFowRjNTVUpCWjBsVlUyRkxTMnAwZGs1a1FXaExRWFV2YmtGNU1uSmFZMnRoVUhkcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhwTlJFbDNUbXBSTlZkb1kwNU5ha2w0VFZSQmVrMUVTWGhPYWxFMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZoVFZoeGNYaGtSbHBSVVV4b00zVXJaMlZZVnpCbVlYWjJTRXN3VFhkelNWQXdXbTBLVDAxU1pFWnNaa3B2YVVGT00xUlljSE4xTTFOMU1sYzNOVUZZWlRWNlF6VlliSGQyZWpGTlVtdEdTa0YwWlhCVlNVdFBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZzVUd0QkNteG9hbXhrZFZSYVlUWkxPRW96YkdwbmNtaHdZWFp2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlYwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FXaDZXVEpvYkZwSVZuTmFWRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJocVdtcFNiRTFFVlRKT2FsbDZUVVJHYVU0eVNURmFha1p0VG1wTk1sbFVRVFJPUkVFelRtMUtiRTU2V1RST01scG9DbGxYUm10TlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5KUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUmtkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZUREprZGsxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sM1dVdExkMWxDUWtGSVYyVlJTVVZCWjFJNVFraHpRV1ZSUWpOQlRqQTVUVWR5UjNoNFJYbFplR3RsU0Vwc2JrNTNTMmxUYkRZMENqTnFlWFF2TkdWTFkyOUJka3RsTms5QlFVRkNhRVJ6T1hOTmIwRkJRVkZFUVVWbmQxSm5TV2hCVEd4TVZGRnlNVTF6YzFrMk1IQklRa3h4TVZWMFpYVUtaVUp0VmpkV2VTOXpNVU5xZDBGRFlVNXBiMUJCYVVWQmMxbElhRVZuZUZwdVNuZFVWVXhhVTBSR1MwazVUSEJFZW5ab05qRndNVXgyVTB0V1JrNXVNZ3BtTldOM1EyZFpTVXR2V2tsNmFqQkZRWGROUkdGQlFYZGFVVWwzUkVWcWVVbEJNbHBuVTBZMGJYQm5kblF6ZEdwaVNEbFFMMEpxYW14aFlWZFFPRkJEQ214WlNsaEJhbll2UWs4NWMxTk9ja292TjNwNlp6WmlhRk53Wm1WQmFrVkJPVVpDUVhoTWVscHZkelpsYVhZM09YUXlhMWhEUjI1VVNERnlSMjFoT0VRS0sxVnpSalJEVG5oVllYUkNVVGRaUmxWQmVrTTVNalJ6T0ZkMVNXMTFhVWNLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1667441229,
          "logIndex": 6395632,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/go/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/go",
      "githubWorkflowSha": "cf4e05666301b7b5f1f636a084076be7687faaad",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3382488255",
      "sha": "cf4e05666301b7b5f1f636a084076be7687faaad"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

