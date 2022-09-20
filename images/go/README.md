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
| `1` `1.19` `1.19.1` `1.19.1-r0` `latest` | `sha256:f7e769d04f6232dc299e622afa3c55bc6a2cd6239516a8ff73038167a2df6046`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f7e769d04f6232dc299e622afa3c55bc6a2cd6239516a8ff73038167a2df6046) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:f7e769d04f6232dc299e622afa3c55bc6a2cd6239516a8ff73038167a2df6046"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "4b4d10a9790dfa4bbd047d4d33c094d6d51d9c51",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/go",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIAaAS89RUo8YtCHAOX07uRvEmCLJgdPACkdgaDcARuzeAiEAuY2obOuIHq65q02Y1ztjDRXSkvNpu1GYJgH4ovU0/RA=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjYjBhZTdhNzMzZDllNjE2ZTM0NDFhZDRiMjRlYmUwNGI5MTE3ODMzNWNkODU2OTU2M2YzZGRkMDAxN2I1ZDA4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQkY1ZDJYUHRrWEhhclhuZzZUQVJ1bEZ4TVRCNnorbU9ZcWhaWmtxS1hkdkFpQmxzUFd6TjZIOW5INmorRU1DcTZSbXlGcjNXOTBqdW1xY2QzeDVpeUhQL1E9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVla05EUVhsWFowRjNTVUpCWjBsVlJHaEVUM053TUZwSEsxcFRTemQyVjNRdldsWk5XRXRPV1VZd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZHZDNUV3BGTWxkb1kwNU5ha2wzVDFSSmQwMVVaM2hOYWtVeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZvTTJKeFNWWmtRMWgwTWxKUVVHeG1keXRsVFhOclMwdHVNMFU1YkVkdlRFUllUMGtLWWtsc2NURlRXQzlVYzIxWUt6aE9ObVkxWVZsVWVqVXhWVVp2VldKdFNVNTJjbW96TXpCVlZuTTBaVXR2ZFRWTkswdFBRMEZyVVhkblowcEJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZaY1VkckNsbzBkMDFRUVdFeU9GaDNjSHA0UTNRMGVFaGlRMEZaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlUwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FWSjNaRmhPYjAxRVdVZERhWE5IUVZGUlFncG5OemgzUVZGTlJVdEVVbWxPUjFGNFRVZEZOVTU2YTNkYVIxcG9Ua2RLYVZwRVFUQk9NbEV3V2tSTmVsbDZRVFZPUjFFeVdrUlZlRnBFYkdwT1ZFVjNDa2hCV1V0TGQxbENRa0ZIUkhaNlFVSkNRVkZQVVROS2JGbFlVbXhKUmtwc1lrZFdhR015VlhkSloxbExTM2RaUWtKQlIwUjJla0ZDUWxGUlZWa3lhR2dLWVZjMWJtUlhSbmxhUXpGd1lsZEdibHBZVFhaYU1qaDNTRkZaUzB0M1dVSkNRVWRFZG5wQlFrSm5VVkJqYlZadFkzazViMXBYUm10amVUbDBXVmRzZFFwTlNVZExRbWR2Y2tKblJVVkJaRm8xUVdkUlEwSklkMFZsWjBJMFFVaFpRVU5IUTFNNFEyaFRMekpvUmpCa1JuSktORk5qVWxkaldYSkNXVGwzZW1wVENtSmxZVGhKWjFreVlqTkpRVUZCUjBSWVFrTmpkbWRCUVVKQlRVRlNla0pHUVdsRlFYTjVUaTl0ZUc5Q05tMXJLMXBRYXl0ck5tSnVTamR4ZW1GTVRHVUtlREE0VjJGVk4xQkxURXBSWlhwM1EwbEZUa0ZqTWtKNVIzTnJUbE1yVUdKaVZreDZLMVpQYmtObWNqZzBUalZoU0UxaGQyd3JXVk5ZY0RaYVRVRnZSd3BEUTNGSFUwMDBPVUpCVFVSQk1tZEJUVWRWUTAxRWJDOU9NREZWUzNSV1NUZE1ORlJqVkRBcmMyNVZhWGx4YjBKWFMxTkVaRTlCU3k5MU4wWmlabTQyQ2poaU5tMTFXbEIxWW5CRGFYaEtNbFZqY1VwUlVYZEplRUZNTTNGdVNpOVNUV2xqYUdWNkwwWTBZbEJ2YUUxbE9YWlBSVXBVTlROdVVtUlVSMWR2VjNFS1JHZHBUWE5QZWtOR1RrWnlSMnBGY25wd0syUlRNR1J1T0ZFOVBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1663696977,
          "logIndex": 3620969,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/go/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3092331375",
      "sha": "4b4d10a9790dfa4bbd047d4d33c094d6d51d9c51"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

