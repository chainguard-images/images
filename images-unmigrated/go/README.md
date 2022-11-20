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
| `1.19.2` `1.19.2-r0` | `sha256:3f7206a2cfbf680b63f71188cd76c7597d35720a0a9a6c95fc5c9556ba74e332`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3f7206a2cfbf680b63f71188cd76c7597d35720a0a9a6c95fc5c9556ba74e332) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.3-r0-glibc` | `sha256:33726485273de4a05831b5378c1df102c1562dd70308d940cb463f24db3eb0ae`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:33726485273de4a05831b5378c1df102c1562dd70308d940cb463f24db3eb0ae) | `amd64` |
| `migration-20221119` | `sha256:2f45aa046e5b2c2035e4b91bc6b7ec8724172f42dcc53329f0c005c0d3a04871`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2f45aa046e5b2c2035e4b91bc6b7ec8724172f42dcc53329f0c005c0d3a04871) | `amd64` |
| `1` `1.19` `1.19.3` `1.19.3-r0` `latest` | `sha256:34ab4ab44406441e81feaf5419072b5cfa4c02eaa03960ba322e87e20f07ac9e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:34ab4ab44406441e81feaf5419072b5cfa4c02eaa03960ba322e87e20f07ac9e) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.1` `1.19.1-r2` | `sha256:ec841359408345c28596a5765253da3870c8364d010cfd55455f6f31e129faf2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ec841359408345c28596a5765253da3870c8364d010cfd55455f6f31e129faf2) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19.1-r0-glibc` | `sha256:afffa26dd6dbd8d52ba0e01c1ce1224fc39d25ae19980cd24ea2263ce6947369`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:afffa26dd6dbd8d52ba0e01c1ce1224fc39d25ae19980cd24ea2263ce6947369) | `amd64` |
| `1.19.1-r0` | `sha256:38adede21243fda456da1a69eaaa0e2291c145dd9ab648332a5a932c0bc61490`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:38adede21243fda456da1a69eaaa0e2291c145dd9ab648332a5a932c0bc61490) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `migration-20221118` | `sha256:86b8a80aa42027a8bfcf90f4f73cf6761f95ea3f4542a53928f9df3547420a0e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:86b8a80aa42027a8bfcf90f4f73cf6761f95ea3f4542a53928f9df3547420a0e) | `amd64` |
| `migration` `migration-1` `migration-1.19` `migration-1.19.3` `migration-1.19.3-r0` `migration-20221120` | `sha256:b7f4f9f1c030114514dde004aeb44580f9407e316b8a83b288fb555d4a247254`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b7f4f9f1c030114514dde004aeb44580f9407e316b8a83b288fb555d4a247254) | `amd64` |


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
        "docker-manifest-digest": "sha256:34ab4ab44406441e81feaf5419072b5cfa4c02eaa03960ba322e87e20f07ac9e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "49c816b965c7598bcc2f94fee693ea5de9389d0e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/go",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDfNym/XXZw7K5SWZ1F6QvbT8AiXDZKmBxmd22I402kVwIhALmcafhs/v/PHB6dRTXFI4pc0pBzvqjwEZHYa6lb59Z4",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhNTc5N2ViZmE4MWI5MTY2NWNjOTVmY2FlNGIzY2YzODFlNGZjZmNiOTdjY2NhZTA4OTJmNDJlMzYzOTgwMjM3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRE9Xd2U4cE5VaHNIa25hWGRYUUhtK3A0dk1iNlgyQzZUelQ5ZTJvRmNHWkFpRUFpMkM1MmNSSUdjMTZENG53ODc3WmQzamFsWWd1WW85aTdQYzIxUTEyQm9JPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhsdFowRjNTVUpCWjBsVldrNU9VbFZYVld4a05GUTJVR3N6WWpkSGEwNDRNRmhGTDJscmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVU1hkTlJFbDNUWHBCTTFkb1kwNU5ha2w0VFZSSmQwMUVTWGhOZWtFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZsTlhkemRrMTBhVmc1Wms5aWVUZFJNMVZVUlRORFVsUlZXRmhEWW05TU5GVTBiRmNLU214aU1GRlhSWEpNTUV4VUsyVmlaVk5FWW1Rd05EUTRhbEpqUzJkclRsZFVlRFIyT0ZoRlVETTJiRE5pTUdoTVpEWlBRMEZyWjNkblowcEZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ6SzNOVkNrbEZZbk40VURCRk5YQlBVV296VEVkVFNVeHdPRE4zZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlYwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FXaDZXVEpvYkZwSVZuTmFWRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJjd1QxZE5ORTFVV21sUFZGa3hXWHBqTVU5VWFHbFpNazE1V21wck1GcHRWbXhPYW10NldsZEZNVnBIVlRWTmVtYzFDbHBFUW14TlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5KUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUmtkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZUREprZGsxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sbldVdExkMWxDUWtGSVYyVlJTVVZCWjFJNFFraHZRV1ZCUWpKQlRqQTVUVWR5UjNoNFJYbFplR3RsU0Vwc2JrNTNTMmxUYkRZMENqTnFlWFF2TkdWTFkyOUJka3RsTms5QlFVRkNhRXBNUjJGVE1FRkJRVkZFUVVWamQxSlJTV2hCVFcxSFpqbHJSV2xwUTJsMVdGSnNRbVJDYW5kSldXVUtaRWsyTDAxR2QwbEllRmhCYXpSNFNqSmxibVZCYVVGV2JHaERURTFMVW00ek9YUkRiRlJ3VUc5dlUzbGFReXRXUzNFcmFVWnVUVEZxUWl0Vk1EY3pNZ3BFUkVGTFFtZG5jV2hyYWs5UVVWRkVRWGRPY0VGRVFtMUJha1ZCYVVzclEyZG5MM1YwWkVKVVRHWlJZWGN3TUU1NlMxbDVSWEpGWlhkalRtVnJhV3RvQ2taM2FtUTRhMHhUWjJoeFRrZFNkbEIzUW01NFZpdHVNemt5V21kQmFrVkJMMlJKWXpsaVRsaENTMDB4Tm5Cc2RWRmlWVlJOUkV4T2FYUXdZVXgxUjBJS1RrRXpTVmh0VlZSVk1FWnpRMWxETURkdFluWjBWa0p5TldSWldHMTBPVW9LTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1668909817,
          "logIndex": 7451668,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/go/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/go",
      "githubWorkflowSha": "49c816b965c7598bcc2f94fee693ea5de9389d0e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3506038746",
      "sha": "49c816b965c7598bcc2f94fee693ea5de9389d0e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

