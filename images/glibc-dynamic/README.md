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
| `latest` | `sha256:1c3d8277ea947f3c8d8664ad7a533e78022851b190da16182671cdc39b4f6c10`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1c3d8277ea947f3c8d8664ad7a533e78022851b190da16182671cdc39b4f6c10) | `amd64` |



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
        "docker-manifest-digest": "sha256:1c3d8277ea947f3c8d8664ad7a533e78022851b190da16182671cdc39b4f6c10"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "229a3a9a1d3d79c2e2aa3144e1e0832c7d992a1a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDHLBE7doLeIlLYf2GIafmBXshRcx8p5qzKZDzRE7GG7QIgF6ZL9DR+jjd5VDzoaSRPeX/Ycm7UsLkZSVJlyoL4Gso=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwMDg1ZDMxM2RlOWIwYmZlODhjNjk3NzQwMWU2ZTllNmRlZjg4Y2IwMmUwMzI0MjE3ZjRjZjM2MmYxODQ1ZmU2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURGYncxdTdoSy9lb045WExoVlR6T0hFbjd2dm9oWTNockZENTZSQm9ZLzFBSWdVVStFeVRJdG9JazBJNUtueHNzd09scWZ3dTlsenFXWmpyV0dxOXhwTUJJPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFWRU5EUVhvMlowRjNTVUpCWjBsVldITmplbkV2VjA0eVRscFlSRFpIVkRWbU5YZzVVRGh1WjB4bmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRGTlJFbDNUa1JSTWxkb1kwNU5ha2w0VFZSRk1VMUVTWGhPUkZFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZVZFVselVHUlhSRkI1UjBzMWJWZGpXRzFZTjBwTVlYRjZSVUpzVFZORGNHUm5kMVFLWjBReVpIaFpTR1l4Ym5KS1VGVTVURXcxVEVwbWVXMVROMDVvVTJ0UVpUbG5jbUpITlhsR1ZHSnJlVXRUTjFwV2JYRlBRMEZzTUhkblowcGFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZMTUV4RUNrRlNjbGRsV2pobGR6VmhTV3RJYm01RFF6bEJUVTVWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJKZVU5WFJYcFpWR3hvVFZkUmVscEVZelZaZWtwc1RXMUdhRTE2UlRCT1IxVjRDbHBVUVRSTmVrcHFUakpSTlU5VVNtaE5WMFYzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXdEhRMmx6UjBGUlVVSXhibXREUWtGSlJXVjNValZCU0dOQkNtUlJSR1JRVkVKeGVITmpVazF0VFZwSWFIbGFXbnBqUTI5cmNHVjFUalE0Y21ZclNHbHVTMEZNZVc1MWFtZEJRVUZaVWpWRFEwRXJRVUZCUlVGM1FrY0tUVVZSUTBsQ2JXaFhVM0J6T0RONmVuVnlkM0ZGWjBSVFVIUmhLeTk1WjFFM01rbElLelo1ZUc1c1ozZEJZVmw2UVdsQmExVkZabUZVUTFsRWNHbEtUQXBUVjJRNVZYaHBlRWcxUWtRemRYcEJlRzlHYWxwWWJ6VmhNMGt4WW5wQlMwSm5aM0ZvYTJwUFVGRlJSRUYzVG5CQlJFSnRRV3BGUVRKNk5GZEdSM05VQ2xWUUwwRjBZMjFJU1ROTk1FbHdkMGRPVGtOTmFUZFhWVFp4VnpWT2JqVk9PVEJFVUhwaGIwaHhWRWg1WlhKNVEydEtjVkJRYzJKVlFXcEZRVzFZVG5VS2NHb3JUMmc1U0ZFMVVWSTRVWG9yVVhwb1YzcDZSMEo1YTNOUUsxRTRUVkp2ZUhSWGJFbE5WRlI0YkVodmNqWlpNbE5KUjNFeFpHaEllbmRyQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1668477892,
          "logIndex": 7096471,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "229a3a9a1d3d79c2e2aa3144e1e0832c7d992a1a",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3466804507",
      "sha": "229a3a9a1d3d79c2e2aa3144e1e0832c7d992a1a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

