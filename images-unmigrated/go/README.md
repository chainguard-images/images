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
| `1` `1.19` `1.19.1` `1.19.1-r0` `latest` | `sha256:b1a14f980129627a92b1012ed813e30c820d0b61a6d4ff5a30030fa7cbd9b86e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b1a14f980129627a92b1012ed813e30c820d0b61a6d4ff5a30030fa7cbd9b86e) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

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
        "docker-manifest-digest": "sha256:b1a14f980129627a92b1012ed813e30c820d0b61a6d4ff5a30030fa7cbd9b86e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "cffa8dfcef61d486d082d9fe8033aca3a78a3c8f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/go",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIGZgXMX+JkIAeJRjxGro1KAe3OZGOcINrBxpje+ime0WAiEArrOjyarnajCGGU2Di2FrynWSw530lFia3gQHHzGUgRs=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmNGRiZDUxYTllOTNmMmIzZWQyOTU2MTE2MmQ1NzJiNDQzODU0NmFhMzI3Yzg1YTVhZDIyMGFhYTg3M2E4YTFjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRXF3VG9OS0FsTHBRMVBPZVlKSlpLc2tOV0dIUUlEY3lqcnhqaFRZYUdlckFpQnlic0VFb0VkWFk4Q3Yvb0JNWHFRa282bStwL3hlcUo2eUNrUXhDNkRneUE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZha05EUVhsdFowRjNTVUpCWjBsVlMzTjBPU3RYYldGa1lsTmlVbWxoVWt4eldsZGpSVFZsSzB4dmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hoTlJFa3dUV3BGZWxkb1kwNU5ha2wzVDFSSmVFMUVTVEZOYWtWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUxUjNOR1NVcHdaQ3N5VEZVdmVUZ3ZkRlF3Tm1SS1NXMW5lSEZDUVVKSVIyTlFTR0VLY1U5VWFpczJRMDFGVkhKRmNrWnJabmxGYnl0b1NVbDJZVlZLVFhNMU0wRlRla1ZtT0ZWdksxWXpjRTlEV1dGc1ltRlBRMEZyWjNkblowcEZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY1Y21GNUNqSlpkWGxqYTJrNFNqRkNUa040TDFKNGNXeHljRzkzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlYwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FXaDZXVEpvYkZwSVZuTmFWRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJocVdtMWFhRTlIVW0xWk1sWnRUbXBHYTA1RVp6SmFSRUUwVFcxUk5WcHRWVFJOUkUxNldWZE9hRTB5UlROUFIwVjZDbGw2YUcxTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5KUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUmtkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZUREprZGsxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sbldVdExkMWxDUWtGSVYyVlJTVVZCWjFJNFFraHZRV1ZCUWpKQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNaekV6YzNCMVRVRkJRVkZFUVVWamQxSlJTV2hCU2xSbU4zUmpWMGRFTlRSVFlqbFFOV1p1THpKV1lqUUtVME01U3pWdGVVeHVjbFJpWW0xdVpsSkRXRzFCYVVGVGRWbHdUVmQwU3pkc2FITlROVVJ6WnpaNWJWRlJkbE15U2taNVNEQnFhM28yVG1zNVJFSmlOZ3BMYWtGTFFtZG5jV2hyYWs5UVVWRkVRWGRPYmtGRVFtdEJha0kwS3pOeGNsbE5NblpYWVdocFlWZFlZVWhzSzJnMk1YSklPWHBPWlhCMWFqSm1Xak5vQ2tOM2N6UlBTVUZvYjBwSU5HOXFiWEZoWlRKMVNUVmFUMk5ZYzBOTlFYaFhlVFpRTW5wWVFuVlBkREZJWlhaVmFWQTVOV0pXYzI1aVVHSkdaR1JCZFhNS2VsVkNRVkZaV0hSSWFrUXJVMmxzTVdObFRVTnFXalpEVFRaR1dVRlJQVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663728160,
          "logIndex": 3646466,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/go/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3094822029",
      "sha": "cffa8dfcef61d486d082d9fe8033aca3a78a3c8f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

