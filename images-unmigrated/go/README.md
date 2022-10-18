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
| `1` `1.19` `1.19.2` `1.19.2-r0` `latest` | `sha256:86ec739d6fc98b5206ba432dc851a06e9211129ca7a432e8dd6efeae192685cb`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:86ec739d6fc98b5206ba432dc851a06e9211129ca7a432e8dd6efeae192685cb) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.1-r0` | `sha256:38adede21243fda456da1a69eaaa0e2291c145dd9ab648332a5a932c0bc61490`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:38adede21243fda456da1a69eaaa0e2291c145dd9ab648332a5a932c0bc61490) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.1` `1.19.1-r2` | `sha256:ec841359408345c28596a5765253da3870c8364d010cfd55455f6f31e129faf2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ec841359408345c28596a5765253da3870c8364d010cfd55455f6f31e129faf2) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.1-r0-glibc` | `sha256:7088ae2aa7b67a10d835e36bdd1e6e724676cc2a85c9321e072c3f34aa854e32`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7088ae2aa7b67a10d835e36bdd1e6e724676cc2a85c9321e072c3f34aa854e32) | `amd64` |
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
        "docker-manifest-digest": "sha256:86ec739d6fc98b5206ba432dc851a06e9211129ca7a432e8dd6efeae192685cb"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "3d047332bc0f0f03812d9a091c6063b22fed7071",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/go",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDtg9q3QS6X+pEWkTzaHI+tIHlNocKcxgGR/k13veRCGwIgUD9WLC2CvLxsVMMojNvUGxUWHsxfkfz+MF7xg89wDCo=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkMzM3Y2Y1MTE4MjRmYzJjYzk5ZjQxMjcyMzcwNWRlNGU1N2EyNjQxNWRhNGM5NTFjMGZkZDFmOTYyMmRjNTkwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRHhoeitDSEluT3p0TEdIV25PeVRQR2R0d3RZUEkrNUMvMm9xOFh6VGdZVkFpRUFoNk03akNab2hhclRqd2h0VEl4WVZlMlpFM3hrZnJrUTlUS3lHN1JudFhFPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZha05EUVhscFowRjNTVUpCWjBsVVMwbDZRMDlSWTBGWFFuUm1aVUkxYlVaSFpVNVZRblIzYkZSQlMwSm5aM0ZvYTJwUFVGRlJSRUY2UVRNS1RWSlZkMFYzV1VSV1VWRkxSWGQ0ZW1GWFpIcGtSemw1V2xNMWExcFlXWGhJYWtGalFtZE9Wa0pCVFZSR1dFNXdXak5PTUdJelNteE1WMngxWkVkV2VRcGlWMVpyWVZkR01GcFVRV1ZHZHpCNVRXcEZkMDFVWjNkTmFrMDBUVVJzWVVaM01IbE5ha1YzVFZSbmQwMXFVVFJOUkd4aFRVRkJkMWRVUVZSQ1oyTnhDbWhyYWs5UVVVbENRbWRuY1docmFrOVFVVTFDUW5kT1EwRkJWSHBMUTJWSWNtSkplbEZpZEZoU1dWZ3lTRmRhTm5oaFozbElWWEI0TDNCMlFYSkhjMUlLTDJGd1VGUXZhRkU0ZFhaTGFsVm9VVk5oYjI5UlZscEplVTA0UkVsclpGTmhjbWN4SzNwWlkzWlpXblJUUVRsRmJ6UkpRMU5FUTBOQmExRjNSR2RaUkFwV1VqQlFRVkZJTDBKQlVVUkJaMlZCVFVKTlIwRXhWV1JLVVZGTlRVRnZSME5EYzBkQlVWVkdRbmROUkUxQ01FZEJNVlZrUkdkUlYwSkNVMm96U21aMkNuVTRZVlIwUzNGYWRWTkpOWGN3VDBZdmNFRlJaMnBCWmtKblRsWklVMDFGUjBSQlYyZENWR1l3SzI1UVZtbFJVbXgyYlc4eVQydHZWbUZNUjB4b2FHc0tVSHBDYTBKblRsWklVa1ZDUVdZNFJWZHFRbGxvYkZwdlpFaFNkMk42YjNaTU1tUndaRWRvTVZscE5XcGlNakIyV1RKb2FHRlhOVzVrVjBaNVdrTXhjQXBpVjBadVdsaE5kbG95T0haTWJXUndaRWRvTVZscE9UTmlNMHB5V20xNGRtUXpUWFpqYlZaeldsZEdlbHBUTlRWWlZ6RnpVVWhLYkZwdVRYWmhSMVpvQ2xwSVRYWmlWMFp3WW1wQk5VSm5iM0pDWjBWRlFWbFBMMDFCUlVKQ1EzUnZaRWhTZDJONmIzWk1NMUoyWVRKV2RVeHRSbXBrUjJ4MlltNU5kVm95YkRBS1lVaFdhV1JZVG14amJVNTJZbTVTYkdKdVVYVlpNamwwVFVKWlIwTnBjMGRCVVZGQ1p6YzRkMEZSU1VWRFNFNXFZVWRXYTJSWGVHeE5SRmxIUTJselJ3cEJVVkZDWnpjNGQwRlJUVVZMUkU1clRVUlJNMDE2VFhsWmJVMTNXbXBDYlUxRVRUUk5WRXByVDFkRmQwOVVSbXBPYWtFeVRUSkplVTF0V214YVJHTjNDazU2UlhkSVFWbExTM2RaUWtKQlIwUjJla0ZDUWtGUlQxRXpTbXhaV0ZKc1NVWktiR0pIVm1oak1sVjNTV2RaUzB0M1dVSkNRVWRFZG5wQlFrSlJVVlVLV1RKb2FHRlhOVzVrVjBaNVdrTXhjR0pYUm01YVdFMTJXakk0ZDBoUldVdExkMWxDUWtGSFJIWjZRVUpDWjFGUVkyMVdiV041T1c5YVYwWnJZM2s1ZEFwWlYyeDFUVWxIUzBKbmIzSkNaMFZGUVdSYU5VRm5VVU5DU0hkRlpXZENORUZJV1VGRFIwTlRPRU5vVXk4eWFFWXdaRVp5U2pSVFkxSlhZMWx5UWxrNUNuZDZhbE5pWldFNFNXZFpNbUl6U1VGQlFVZEVObEJUWnpSM1FVRkNRVTFCVW5wQ1JrRnBRV3hWU1dseFdUbG9NMUp2UzNoMmQyaEpVVGhsTTFSMmJ6SUtjbE14VW5SNWVXMXJSbEJNWm1KUWVFNW5TV2hCU25KR05FeHNSbVUzV0dGNmFtVm1jRE5zWWxBM1JreHRlSFJSVXpoUWFtbHNZVk4zZFRjMU1VSkJXUXBOUVc5SFEwTnhSMU5OTkRsQ1FVMUVRVEpuUVUxSFZVTk5TRzVWTHpkVmVFOTFUemw2TXpaMlRVWXZaQzhyTjJRMGFtdzFlblZJYlVnMGQyRlNOMGw0Q213d2MzazNWa3AxY0ZweVJUbHFhRmRwWjFaV0sxSklRVFYzU1hoQlRHOHlRUzlWT0RWdk1XcDBWMVEyYzB4bllVVkxTRzh3WmpKd2VHZHNXamdyWVdNS1NYQnRNMGhsUkRKT1YyUlFRa3B4Y1hoRlYzUnViVGxVU0VGQ2NIZDNQVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1666060714,
          "logIndex": 5320895,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/go/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/go",
      "githubWorkflowSha": "3d047332bc0f0f03812d9a091c6063b22fed7071",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3270177318",
      "sha": "3d047332bc0f0f03812d9a091c6063b22fed7071"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

