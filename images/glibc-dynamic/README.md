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
| `latest` | `sha256:28e14ef35f417adf102f509736d2e0cd200b1431fb56bf1f80c851a649a71b63`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:28e14ef35f417adf102f509736d2e0cd200b1431fb56bf1f80c851a649a71b63) | `amd64` |



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
        "docker-manifest-digest": "sha256:28e14ef35f417adf102f509736d2e0cd200b1431fb56bf1f80c851a649a71b63"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "6b6b31a8d3c1d3960a37ee844adc7f9330fcceb0",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCzEfCtkLSg7Cci32sPXv2PeqoBRv0oVXrE3gy8hmJGJwIhAKqASogqpRtXnp5bRYeqpYxYtEzoM0Srk5c/sRU/yenx",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhZThkZThhZGQ1YjMzMDQ4YTkwOTM2Njk0MzhhNTIzNTIwMzYxNTFmODljYWQ5MmM1NmVmMmJhNWI4ZDNmMjQ5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJREt1UGdhc3c4UU1jNWpmby8rWk9pcHlYYW9iWjJOTEFwcEVyaWhmNFBoWEFpRUE2YU82UFU1VWZaazRNV0VTLzljU1dtZUlEckk4SEJxY3prN1lEVythSkdvPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFSRU5EUVhvMlowRjNTVUpCWjBsVlZsSTFWR0o2VlRoWU5WWlNSbXhwZFdoWFJIQnJRVk00WkcxcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRSTlJFa3dUbnBKTVZkb1kwNU5ha2w0VFVSRk5FMUVTVEZPZWtreFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUzV1M4MFVGQmpRelJpVmxodFpHd3hUamh2U214NlVXdHNTa3hHU2pSRVIwbGtURXdLWTBadFQxWlJlVmxVVEhOcVoySXlWa1IyVjNCTGMzZEdLekZtVEhNclVVWllSbE5ZTDFWUmRHaFhURmxwV2xvd0wwdFBRMEZzTUhkblowcGFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZSYlZOVkNqRnRZalZzTWtWTlR5dEtTbk00VGxsRU1tTk9lamhqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJhYVU1dFNYcE5WMFUwV2tST2FrMVhVWHBQVkZsM1dWUk5NMXBYVlRST1JGSm9DbHBIVFROYWFtdDZUWHBDYlZreVRteFpha0YzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXdEhRMmx6UjBGUlVVSXhibXREUWtGSlJXVjNValZCU0dOQkNtUlJRVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVUc4dlVua3JRVUZCUlVGM1FrY0tUVVZSUTBsSU1HeDRjWGRxTWpkdkswOXVXVFpxYkRGUVQzYzFkMUZzSzJ0VWN6RkhNekI1VFhGc1kyWXphR0U1UVdsQlF6aElWRWRaZWtaSVVsbElWZ3BMVjNVeGRXcEpaRU00ZGxodmNsb3ZhSFYyYVdkNGFubDFNRnBoU2tSQlMwSm5aM0ZvYTJwUFVGRlJSRUYzVG05QlJFSnNRV3BGUVhadk5IUlZjVU42Q25vdmVtUnZURzVqYlcxV2VrWnBWbnBxVm1od05uTjZUMEpRYlZaWk1FVkVja2NyTldreE9IRkhPVlpZT1dNMGFsaFVUQ3QyYlc5aFFXcENibmRwVEhRS1ZXaFZNV05QWTBaQkwxZ3lTRzE2ZWxKM1RGWXlkbVpxWkZCb1F5dHhVa3B5UlN0QmF6VnZLMlJuVFhKTU4yZzNNVEJ3V0dOaVZVRkJORWs5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1666061249,
          "logIndex": 5321372,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "6b6b31a8d3c1d3960a37ee844adc7f9330fcceb0",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3270227902",
      "sha": "6b6b31a8d3c1d3960a37ee844adc7f9330fcceb0"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

