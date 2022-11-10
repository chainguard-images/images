# glibc-dynamic

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/glibc-dynamic/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/glibc-dynamic/actions/workflows/release.yaml)

Base image with just enough to run arbitrary glibc binaries.<br/><br/>This image is meant to be used as just a base image only. It does not contain any programs that can be run, other than `/sbin/ldconfig`.<br/><br/>You must bring your own artifacts to use this image, e.g. with a Docker multi-stage build. If you want locale support other than `C.UTF-8`, you must bring your own locale data as well. This may change in the future based on user feedback.<br/><br/>See also [musl-dynamic](https://github.com/chainguard-images/musl-dynamic) which is an equivalent image for running dynamically-linked musl binaries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/glibc-dynamic:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:c0351cc18a95d889ec7060b303e4755b4a035c099fc4f27e165a44364c007dd8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c0351cc18a95d889ec7060b303e4755b4a035c099fc4f27e165a44364c007dd8) | `amd64` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/glibc-dynamic:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/glibc-dynamic:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/glibc-dynamic"
      },
      "image": {
        "docker-manifest-digest": "sha256:c0351cc18a95d889ec7060b303e4755b4a035c099fc4f27e165a44364c007dd8"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "2902266ff9af13fcf155826d48b2edc5c6e6b47e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDqqrZq36bD+JT/KpmoIEq/Bg5WRxoOex/ckmQdHyy1ZgIhAKecPHLDViVAYHxt7+Wg+AJ9AH+Wt+Q9/NbtulpXUu9O",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4ZGI0MTYwMjFlMjQyZGIwNzNlZTI4OWIyYmEyYmY4N2NmNTBlMGQ4NTM2MTQyMzUzNzZlZGJlNTlhMDA0ZDhhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRnBEY045aFF2bEN2MzB2ci93TmRFengwd0ZZanEvc004OTROb3VpVDFCM0FpRUF2ZllkVmx6MWlvdVJhVWhRSVFPV3RGWGE1UUVqamV2Q0hUTVk2RVI4TkNnPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFSRU5EUVhvMlowRjNTVUpCWjBsVlQxUmpRMUJIWjNWcFRYSlhkbU01WVZCbmExVXhTVGd6WkRRNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhkTlJFbDRUbFJGZVZkb1kwNU5ha2w0VFZSRmQwMUVTWGxPVkVWNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZrYWpSdk9HdHdZazVEYkc1V00wUjNiSGhYT1hoTmRuTnNjRU5xYjNobVprbE5XbFVLTjBKV2VYTnhjSGw1VFhSbFVYaGhOeloxVWtzdlJrMDVReXRrUVVZM1psWTFZVk5WYkhWaFlrNTJXV3BZYzBvdlUwdFBRMEZzTUhkblowcGFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUwVlRGWENtSkJZa3RRY0ZFM1VFaDNORWRRT0dSa1FuRk1hSFUwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJKTlUxRVNYbE9hbHB0V21wc2FGcHFSWHBhYlU1dFRWUlZNVTlFU1RKYVJGRTBDbGxxU214YVIwMHhXWHBhYkU1dFNUQk9NbFYzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXdEhRMmx6UjBGUlVVSXhibXREUWtGSlJXVjNValZCU0dOQkNtUlJSR1JRVkVKeGVITmpVazF0VFZwSWFIbGFXbnBqUTI5cmNHVjFUalE0Y21ZclNHbHVTMEZNZVc1MWFtZEJRVUZaVW1aVlpVeE9RVUZCUlVGM1FrY0tUVVZSUTBsR1JYTnlVRk5oVUU1eVpWVndRWFJ6YURCWVEwdHFNRlExZG1sSmIxb3hXVVo1VTFONGVYRjRTRzU0UVdsQ1FXcGllR1kwZVdZeFpXRlpOd295UzNndlUxZENaSEowVkRZd1lqUktXVUZrVmxvMFlUSTBTM05UTTFSQlMwSm5aM0ZvYTJwUFVGRlJSRUYzVG05QlJFSnNRV3BCTkcxaVRscG5ka1IxQ2sxaFR6TjJOVmd6UlVGVlFrRlFOVGczTkRkNWJ6bFVja0k1TUROM1ZISXZabkEyWmtKalRXMU9Wa050T0VJNE5FVlVVRkZpZGtsRFRWRkVWSE5pYTAwS2EzQlVlRTlEVjJSdGEwSTBSVTVUYmxoV1Z6ZExURTU0VkVGYVpYSkpiVFJXUTNScWIwSTFhMFpDTjI4elEyMHhaVVF4WWtsRFdqQkhkM2M5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1668046517,
          "logIndex": 6807617,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "2902266ff9af13fcf155826d48b2edc5c6e6b47e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3433436771",
      "sha": "2902266ff9af13fcf155826d48b2edc5c6e6b47e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

