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
| `latest` | `sha256:49a36246ce10d7d1f03805e7471aa21e85ff2e6e4dc70ecd379a3ca2769270e6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:49a36246ce10d7d1f03805e7471aa21e85ff2e6e4dc70ecd379a3ca2769270e6) | `amd64` |



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
        "docker-manifest-digest": "sha256:49a36246ce10d7d1f03805e7471aa21e85ff2e6e4dc70ecd379a3ca2769270e6"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "d8a7f60b5867df5f1e5def341397ea2c17642ac8",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIEaIw8i3e0yc8ZAcYUPoa6gzOY4YXo7ARUwjFZ9GquqWAiBKflmVnTB7lJN2JoScWbjJZxFzgI96x2SkScuCX+w/Vw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlZjE5ZjJiODcwODc1ZDllYTgyMzRhZTAyODBjZDc4YTY5MTIyZmE1ZDZmYTRkY2NjMThhYzk2MmI1NGU4YWNjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUQ4eWVTWHd5em1XU3NZc0x4d0J5M3V6bnNMd2hZb3R2TVVpbzJMUmdtUHVnSWdhbmxEWndIc1hEenNRVjN1NHg2Z0pSZFQ0VDM3SWJQOUY3TEJsRzFPcThzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFha05EUVhvclowRjNTVUpCWjBsVlkzY3ZNMDV4TnpsTGEzbFdXRTVrTjBGclRrSnBXa3B4ZUZGQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlROTlJFbDNUa1JCTTFkb1kwNU5ha2w0VFZSRk0wMUVTWGhPUkVFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ3VUdwclMyMXJkM1JsZVM5MWRrUkdVbEJoVVZkSWVqVTFkSGxGYUhGVWNIUkZabWNLUXpkbWJYb3dUMVJHY2pKVFkzZ3dSM05IYUVGNGNVRXlSa3d5UTBwNGN6RkxVMFJuV2pka2EzSmtMMXBvYkdacU1FdFBRMEZzTkhkblowcGhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZsWW1sUkNrNWxVRWtyV1dRd2RVNUhla1ZuWjJjdmVtOVRXRGx6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMGRSTkZsVVpHMU9ha0pwVGxSbk1rNHlVbTFPVjFsNFdsUldhMXBYV1hwT1JFVjZDazlVWkd4WlZFcHFUVlJqTWs1RVNtaFplbWQzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXOUhRMmx6UjBGUlVVSXhibXREUWtGSlJXWkJValpCU0dkQkNtUm5SR1JRVkVKeGVITmpVazF0VFZwSWFIbGFXbnBqUTI5cmNHVjFUalE0Y21ZclNHbHVTMEZNZVc1MWFtZEJRVUZaVTBSV1JEWXlRVUZCUlVGM1FrZ0tUVVZWUTBsUlEySlljWGhCVDJkWWEyZDRVbmxUU0VFeWNWTjViV2h0UzB0dk5VMTVVRFZWTjJ0RU0zbFNjMlZvYVdkSloxRjZjbTFzU3pndlUxRklNZ3BPWlN0RmRYWnlPRTlRU0hwYVZqaHJaQzhyTkcxMk5IQjNXbFJ3TmtoSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFVSaFVVRjNXbWRKZUVGSkwzVlZWblZ5Q25Sd2FVVkNUMVV2TWxkWlpsTjNkMHRKYkRSc1RrTndNSFV6ZVdKalFWaHhlRE5pU1VaTFJIRlpVSEo2T1U1c00xVmlhVlV6VEM5T1lVRkplRUZRV2pjS2VVdG1iM05yU0VSYVIzSm9SRkp1UWs1bGFtczFXSFE0YmxwdFJsWllVbGswUkd0NFNXNUJTWE52WW1zNFkwVnhUM1pqUkZwUlZ5OUhOVFZFYUZFOVBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1668650650,
          "logIndex": 7243669,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "d8a7f60b5867df5f1e5def341397ea2c17642ac8",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3484722507",
      "sha": "d8a7f60b5867df5f1e5def341397ea2c17642ac8"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

