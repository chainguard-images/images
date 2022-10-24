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
| `latest` | `sha256:8bdfabd6727024be3a8e82a2240de473c5b7439e7cfe48862f8b7fc456267083`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8bdfabd6727024be3a8e82a2240de473c5b7439e7cfe48862f8b7fc456267083) | `amd64` |



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
        "docker-manifest-digest": "sha256:8bdfabd6727024be3a8e82a2240de473c5b7439e7cfe48862f8b7fc456267083"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "2d77290df2462aa98d155b0dc04c9eb8f17c2a35",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDGjXc45gmZQnqtHWPUw4lXr46jPawXpKSsL4O+RXu+cQIgZ6dH0fjhbwqW0OmlLa+gmeCYiCnHEnvaAIdurZOoCXQ=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0ODFlNmRjMjI0NTk2Y2E3YmI5ZDc1ZTc3OWY1MmU4YmZiNWMyOTIzNGY2MGNkMmE3M2U4NDQ5ZDMyNTUyNWVkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUM0cjIxK1ZLa1ZFQXRsTHN2TVlNclhqaitYRkdIV0pQL290YXI1dFJQNGZBSWdUVW5sb0xvT2tqN2U2QlB2aVFGdkdYaGpOaVdCQVV4eldTY0UwM3ZMbTVzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFWRU5EUVhvMlowRjNTVUpCWjBsVlN6TmxVMW8yTUZaVlJVd3hWMGxpWm5GaFRHbFVhR014VW10M2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RCTlJFa3hUbXBGTWxkb1kwNU5ha2w0VFVSSk1FMUVUWGRPYWtVeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZCZFVOUmNrZE9VbE5WVFVWM1NYRndhVWxpVGxsQlJubFVXR0ptZUZGaWNHWkJjMGNLWWpOVWFHVnFkSEUxYkhSbE9ERnhRbFZvYzJrckwxSkJOMUJQT0N0MlprSmFSRUpoUkVSNmVUVmFaMGc1YkhOMUt6WlBRMEZzTUhkblowcGFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZhUlVRekNsWjBhV3BJUkhodVNVOVpSR3MzYVZkaksyNU5lVlZuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJLYTA1NlkzbFBWRUpyV21wSk1FNXFTbWhaVkdzMFdrUkZNVTVYU1hkYVIwMTNDazVIVFRWYVYwazBXbXBGTTFsNlNtaE5lbFYzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXdEhRMmx6UjBGUlVVSXhibXREUWtGSlJXVjNValZCU0dOQkNtUlJRVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVVVnMk1USkZRVUZCUlVGM1FrY0tUVVZSUTBsRFlURjFUV1JTVEhCb1VGQllSSGhZWjJwNVMydHhZMGN3VHpKS2FIWklUV0pQVm1aWFRFWmpkakoxUVdsQ1RHZEpVVWMwWjFaaFJXRjRiQW81U0ZWTlIxcERZMjl6V0dWdVZVVkljR05VYlVSeWVGUXlkbVZGU0ZSQlMwSm5aM0ZvYTJwUFVGRlJSRUYzVG5CQlJFSnRRV3BGUVNzd1FqRkZhakYzQ2tzM2JrdG1ZV0pUYVNzNWJHZHlXbFJIYjA1WFJXcFpTRVprY0dFeGRFRkpXa2N3TUVWNFoxWndaREJtYzJsclVtSXZabWh3UzFWNVFXcEZRVE4yTlVVS2MwYzVaV0UxTkRaR2RVTjBiM2QwVm5kVVpqUTJiWFY1U25CTVVsaGphMEo1UkVwUWJFTm5OMFY2WTBKMVRtMWpSak5sUkNzek1pdDNkREZNQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1666580180,
          "logIndex": 5735169,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "2d77290df2462aa98d155b0dc04c9eb8f17c2a35",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3309665867",
      "sha": "2d77290df2462aa98d155b0dc04c9eb8f17c2a35"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

