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
| `1.2.3-r1` `latest` | `sha256:dec707d13fbb83d86c01aa080ea096a51b6734ff91a71f2d286271af22e09397`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:dec707d13fbb83d86c01aa080ea096a51b6734ff91a71f2d286271af22e09397) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:dec707d13fbb83d86c01aa080ea096a51b6734ff91a71f2d286271af22e09397"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "7a2b61e4ea2516a1e62c094688895c03393aaa0f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIFUuvKt5jSoOaRbaMsqzW/NS+1x31kCTW0Xwd3xiSpoMAiAOsccRlLHAPLCDYLq/DlIv/kPMNH83/qzE+LgkhVk4OA==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5MDA5MzMwNWFhZDUyMDM5MTdkZGY2OTI0NDcwN2Q1YzFiYjMwNzRhYjI0YWY3MTNhNzA3ZGEyMTJjYjE5ZmFiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSGhJWk1OTk5nSjdLaEJ3WU1KZkYrOGNqUlE2cnlzVWRUckJvSHQ0dzdnZEFpQUt5cDlrYVZNd0tmeTAyUXErQzJERUtUdDFZZGpIMjEzbmhMK2RMY09GVWc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZla05EUVhseFowRjNTVUpCWjBsVlUwUnBiRmwwU1VVemJ6UjBaVWR2TWpaTGFVMHJWMDFtUlhZd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTmFrbDVUVVJOTUZkb1kwNU5ha2wzVDFSRk5VMXFTWHBOUkUwd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYxUlZaa1RXMXlXbVVyVTNOaEt6QnVTblExVVRoc2JuTnNMM0o0ZFV0UVJEbFJSbGdLSzJwMGRtTkNlVEUwVjFkU2JIUkJVVUp1TDJWSE9XbzFha1ppTUN0TmFsTmthRTVtZUhsb1VsSkdRMnhUWkZoQ1JrdFBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZzUTNKMENsaExVSGxhUm5sdVlVcFRjakpTU0RKcWRtMVZUMVZOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BpV0ZaNllrTXhhMlZYTldoaVYyeHFUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVk5DWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZTZDJSWVRtOU5SRmxIUTJselJ3cEJVVkZDWnpjNGQwRlJUVVZMUkdSb1RXMUpNazFYVlRCYVYwVjVUbFJGTWxsVVJteE9ha3BxVFVSck1FNXFaelJQUkdzeFdYcEJlazE2YTNwWlYwWm9DazFIV1hkSVFWbExTM2RaUWtKQlIwUjJla0ZDUWtGUlQxRXpTbXhaV0ZKc1NVWktiR0pIVm1oak1sVjNTbEZaUzB0M1dVSkNRVWRFZG5wQlFrSlJVVmdLV2tkc2VtUklTblppUjFaNlkzazVkR1JZVG5OTVYxSTFZbTFHZEdGWFRYZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwcENaMjl5UW1kRlJVRmtXalZCWjFGRFFraHpSV1ZSUWpOQlNGVkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkZZNVlUZDRRVUZCUWtGTlFWSnFRa1ZCYVVFMVoyWkRSR3B6TXpVMU5tMUZRV0UzY3pkT1drWUtlVXBvZFhBM05qUk5ORTFPZUhsTFp6RXdibXhaZDBsblRqSnhZVU42VTFwemNVVkRiblV5V1UwNE1FUmlaM2d5T1d3dlRrRmlWRkkyVjJRM1JYSjFTd3BMU2tsM1EyZFpTVXR2V2tsNmFqQkZRWGROUkZwM1FYZGFRVWwzVmxWSkwwaG9aRVJOYm1oSVR6WTRiSFZoUlZoWEwwc3pWRXMyT0dkdVF6ZDBhWGt3Q21wNFJqQTNiazR6ZUc1elZIbHhLelY1TkhsdVlrOXlWR3BWY1dOQmFrSmlUMFJzYm0xQ2FYZFRjRVJZTjBsRVRqUXJOSEp2UW5ocVNFUlVZM2hrYTFRS1MwcGhla3R6YWpRemVreEZiRlJXUkVaVmVtMDROMGRNVEVWRFF6ZHdRVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663626071,
          "logIndex": 3564915,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3086008572",
      "sha": "7a2b61e4ea2516a1e62c094688895c03393aaa0f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

