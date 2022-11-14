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
| `latest` | `sha256:b38ee4ce3d70ad3565a3e1aacb82de3f2c572483ba5b9a73877610ef5edf009f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b38ee4ce3d70ad3565a3e1aacb82de3f2c572483ba5b9a73877610ef5edf009f) | `amd64` |



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
        "docker-manifest-digest": "sha256:b38ee4ce3d70ad3565a3e1aacb82de3f2c572483ba5b9a73877610ef5edf009f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e3ba66b4facae9001ba282f52498ed677cbb26e1",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDzjJUtyAjd0qhKzrPV4ID+ofY/h8ypeiCDfF+V+0eyygIhAP0LyiBZ9DNhuyoII6EyVtwlN78LzAuMX7TVe2ZEVVCR",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyNjRjNjIzNDAxMmNhMmE0NGVlYjJjZjg2YWQzNjlmNTcyNWU5NGY1NmM0ZGEyYjAwNzM1ZDU1YzA1NGE3MzYxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURGT21zY0lTSFhaNlZpRTZ3Q3lPOXZ3b0Y2L0ozNW0wR1R5dFRESkd0ODd3SWhBTlhubVl1M1k1R3dGTXBsY1FvN1YrYjhnMllQT214VStIbHR6OVhCd3lLaCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFWRU5EUVhvclowRjNTVUpCWjBsVlJHcEZaVzVqYVZGMmNISXpPVFJsZWpKSWEwaHBjMkpXZWxJd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRCTlJFbDNUbXBKTTFkb1kwNU5ha2w0VFZSRk1FMUVTWGhPYWtrelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV5UTJGWVl6SXlUUzg0YVM5c2VXMUJNV1pDSzBaUGFWZDZUVXhOTW5wTmMwOVlhVXdLVEZOaldGTTRkVUZPTDBvNVptbG5aMU5EV1ROTE5rczFMMWhEZGtoVFRIUnZUM2MyYzJsdWJHSlFialk1TjFjeFQzRlBRMEZzTkhkblowcGhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZSYVVONENrMUdibXhRZURjMmRIb3lUbXBWVjBOSE4zQk1Ta00wZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMGRWZWxsdFJUSk9iVWt3V20xR2FsbFhWVFZOUkVGNFdXMUZlVTlFU20xT1ZFa3dDazlVYUd4YVJGa3pUakpPYVZscVNUSmFWRVYzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXOUhRMmx6UjBGUlVVSXhibXREUWtGSlJXWkJValpCU0dkQkNtUm5SR1JRVkVKeGVITmpVazF0VFZwSWFIbGFXbnBqUTI5cmNHVjFUalE0Y21ZclNHbHVTMEZNZVc1MWFtZEJRVUZaVW5vME1DOVBRVUZCUlVGM1FrZ0tUVVZWUTBsUlEyZEhaWFJ0ZWs1VWNVd3dSVFJSWWxONE1FVjRSMHhSVXpkeU9UZG9WaTlwVFhGM1RVcHVlSE5uTVVGSlowcFVUVGhCVUd0SFNTdHBWd3BTWlRSSkwzQnVaV2hRWjFGYU9FZElTR3QzUW14eEsxaENjbEJtSzBwemQwTm5XVWxMYjFwSmVtb3dSVUYzVFVSaFFVRjNXbEZKZDJSU1VIVTNMME5pQ2tnME4wRTRkMDl2VFVoeFMxWjZNMFJuTWxoNGVtOW9NVlZzWlUxSEsyTkVkMDQwUlZaa2VpdFdOa1ZJVW5wbmVXeFBZMmR4VDFaQ1FXcEZRVFYyTUZvS2NGRktlRnB0V25WTldubG5Sa0pOZWxOclFWcE1WWHBvTWtOd1RrcDVaMEZxYzFwa2JVUmhNbWRwYkVWNmFVUXJVamwzWWk5RVZqbHBiMWhQQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1668391593,
          "logIndex": 7025057,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "e3ba66b4facae9001ba282f52498ed677cbb26e1",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3457970480",
      "sha": "e3ba66b4facae9001ba282f52498ed677cbb26e1"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

