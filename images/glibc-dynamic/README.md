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
| `latest` | `sha256:5d3beab5439dd51f43b4168de30e681c0768441e5642586a1f638e73b961405c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5d3beab5439dd51f43b4168de30e681c0768441e5642586a1f638e73b961405c) | `amd64` |



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
        "docker-manifest-digest": "sha256:5d3beab5439dd51f43b4168de30e681c0768441e5642586a1f638e73b961405c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "14bcaac27115e2dbc8906bf25bd1c61c980f736a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCkVOOSZkOok2mW/vwaZuPmZClOIpTszT1wT8B0u+4pjQIhAPvAmalM7Eik//MHKSg3cAXA/QurWOW7d6t+AGMQNfBb",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2OGFiN2UyODdiYjBkNjc2MzkzN2RlMGMxZjk2MGM5MTZjNGNkM2ViNTI1ZjkwZGRiZTY2NGRiMDU5MGQ4NDNlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJR0paMXNrUS9Sb2l1K0M5eEo0QXZCWHd1RkdBMldMdXNhYUVlbkllSmdNZ0FpQkRHWVN6WkJLbVdOY3JXeE9vZkR3U3dWcDU2TnAzVER0VnVrRmkzSnhabVE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFla05EUVRCRFowRjNTVUpCWjBsVlNFc3pNalptVVZGWVoxWTFjMnBzTDFwR01ETm5hbXhDTDFWemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhoTlJFbDRUa1JWZVZkb1kwNU5ha2w0VFZSRmVFMUVTWGxPUkZWNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ0VW0xMFJYTnVNeTkwZG5sdWR6ZDZNMUpLVTB4WmRsSlVVemwzUVRGUWQxSm9VbVFLUlM5Q2NXdG5XVEJ5Tms1TmJUUnpja05GTnpCdGRsZDVRa1kwY2xsR05HSXlRMEZpSzJ4M05XVlVXSEZQVWxoR2R6WlBRMEZzT0hkblowcGlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV6ZEVac0NrOVhaR2hVV1dzeFpHZHJlVFJFU0VkS2IwZE5aVEZqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJGTUZsdFRtaFpWMDE1VG5wRmVFNVhWWGxhUjBwcVQwUnJkMDV0U20xTmFsWnBDbHBFUm1wT2FrWnFUMVJuZDFwcVkzcE9iVVYzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldYTkhRMmx6UjBGUlVVSXhibXREUWtGSlJXWlJVamRCU0d0QkNtUjNSR1JRVkVKeGVITmpVazF0VFZwSWFIbGFXbnBqUTI5cmNHVjFUalE0Y21ZclNHbHVTMEZNZVc1MWFtZEJRVUZaVW10a0t6bFdRVUZCUlVGM1Fra0tUVVZaUTBsUlJEVXdjMGR4Y1hacFRFNU5LemhTWXpkSVVUWTFWSGw0TDBkME5UVjNOMVJIY0Zabk9FMXRhVFZCZUZGSmFFRk9jVE5DYzBzNFlWRXZaQXBpVGk5TlFrSkdRWGRWTmpGWVRWYzVPWFU1VHpjNFJITTNSMGRpY1dwc1JrMUJiMGREUTNGSFUwMDBPVUpCVFVSQk1tdEJUVWRaUTAxUlJFNDRhRXhDQ2xSSmEyWmxXV1J2WjFCT1owdExiMjlJU213Mk1IZFNkVVl4YTFkcFJVOTFRemd4ZUVaVVJDOHhXVkUwYkhnMmFXUTVObWhtYW05YVZtb3dRMDFSUTBjS2NTdE5VMEpNUzJ4c1VrVktkaXRKWkVjMlkyZ3dkRVZDUVRBME1VUlplbnBJVmtrM2N6RXpkbkZDTTB4R2FqRTVZVnBqYVVOdFQzVXdXRXhhUTNVNFBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1668132898,
          "logIndex": 6850819,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "14bcaac27115e2dbc8906bf25bd1c61c980f736a",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3441966820",
      "sha": "14bcaac27115e2dbc8906bf25bd1c61c980f736a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

