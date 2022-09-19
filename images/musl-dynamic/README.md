# musl-dynamic

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/musl-dynamic/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/musl-dynamic/actions/workflows/release.yaml)

Base image with just enough files to run static binaries!<br/><br/>This image is meant to be used as a base image only, and is otherwise useless. It contains the `alpine-baselayout-data` package from Alpine, which is just a set of data files needed to support glibc and musl static binaries at runtime.<br/><br/>This image can be used with `ko build`, `docker`, etc, but is only suitable for running static binaries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/musl-dynamic:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1.2.3-r1` `latest` | `sha256:cc7748258359283366ae1b44e12568da6bfe3d30cd7c414dffca66581a91542c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:cc7748258359283366ae1b44e12568da6bfe3d30cd7c414dffca66581a91542c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

See the [examples/](./examples/) directory for
an example C program and associated Dockerfile
that can be used with this image.


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/musl-dynamic:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/musl-dynamic:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/musl-dynamic"
      },
      "image": {
        "docker-manifest-digest": "sha256:cc7748258359283366ae1b44e12568da6bfe3d30cd7c414dffca66581a91542c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b1aa189b9662a4ca6e5199298755296ca9d52cb7",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDZjHABB9FStYMpxBmz8/tkxWTjgY4VlpV9OfTlLJFkUwIgTSuuZ4AQrrwNK2MbPYIgvWgthM0lmqE3fBxtsWcGHTg=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjMDAxN2JkMjIyYWEwZGI1NTMxYWUxOTdkZTdkZDY1NzhlN2Y0NTg2NGJjMmExNDg4ZDZmMDM4ZmU1YzE1ZjVmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUQ4Sk5aZ2wyWEhEanIzSUNUTHp2L0dYTks5cUgvdlFPMDcwRSsvK2xQSDFnSWhBTGlSNU5CVWd4ek9oS1lCOXZYWnZ0R1VVOFNSSkV1K3pYb0JpSU5Ldjd4dCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhwRFowRjNTVUpCWjBsVlpEaHVOelJvZFdoSlZsWkpRMmcwZGxoU2VsTTNhMXByTUhRd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTlJFbDZUVlJOZWxkb1kwNU5ha2wzVDFSRk5VMUVTVEJOVkUxNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUxUVZFdlpVUkxTVVZPUWpJd1pUQjFORkJUUmpncmVXeFhkRUYwUm5kWEswRlFTRXdLVWl0S1VIRlNla1FyTWl0V2JuTkxRWFowWTJJNE5uRjRObGN4Ym5rMUx5ODFSRzk0VEhsemMzVnBkbUoxY0VFM1ZYRlBRMEZyT0hkblowcE1UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZRT1dSTkNtaENNazFhU0VoUU9TdDJlbFV6UW5sNlVrbzRNRUV3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BpV0ZaNllrTXhhMlZYTldoaVYyeHFUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVmRDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZvZWxreWFHeGFTRlp6V2xSQk1ncENaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm9hVTFYUm1oTlZHYzFXV3ByTWs1cVNtaE9SMDVvVG0xVk1VMVVhelZOYW1zMFRucFZNVTFxYXpKWk1rVTFDbHBFVlhsWk1ra3pUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRFZVZERhWE5IUVZGUlFtYzNPSGNLUVZGVlJVWXlVbkJqTTFKNVlqSjRiR016VFhaaVdGWjZZa014YTJWWE5XaGlWMnhxVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVhkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpsQ1NITkJaVkZDTTBGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5NVTlYUzJKalFVRkJVVVJCUldkM1VtZEphRUZOY2l0dWEwZzNWVGN2T0cxeWJUTUtiMkl5VG14dFpsRm9UVlZrWkVWRWMxaGFUR2RFWmxCWUswSTBNVUZwUlVFd2FWaENjRGxLTXpSRWEzTnRaR05CWWxwaGNYQTBRMFk1Vkd3d1MwdHFVd3BwV0U1dlZYa3dhemhTUlhkRFoxbEpTMjlhU1hwcU1FVkJkMDFFWVVGQmQxcFJTWGRGZFhwb01ETkJTakYxU0c0M1R6Y3dZVVI0ZVRkd09HSlphVEpYQ2xkWFdEZFRVbGhQWTJadVQxUjFNVEJ2Wkd4T1NYZG1Ta1VyVVUxTVEyZHlPSFZCTkVGcVJVRnpkbGMxY0RSU1ZubGxZM1pCUmpOQmVWVmFVMlpDZFhFS1RDdHpURzQxVVROQmVHcDJSeTg1TWxCS1NVZHhiMG8xVW5WMk5XZGlNamhZWkZkamJXZFRSQW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1663554711,
          "logIndex": 3531498,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3079564677",
      "sha": "b1aa189b9662a4ca6e5199298755296ca9d52cb7"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

