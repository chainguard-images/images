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
| `latest` | `sha256:fc32e1e5d84bc642af062f45dc586c15d1e419a9983ce5948fc6636eb2f450a0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fc32e1e5d84bc642af062f45dc586c15d1e419a9983ce5948fc6636eb2f450a0) | `amd64` |



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
        "docker-manifest-digest": "sha256:fc32e1e5d84bc642af062f45dc586c15d1e419a9983ce5948fc6636eb2f450a0"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "bb91c43dcbea0a44b4b3cc1599743c5660ce4c58",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIGSlr4cxv9b6S/gauyZbt7s8P/JylTQoRyxLwHF3lnigAiAVjzPXpiPaJYTlY45HTtvZXkXTosDdQz8oROgtU5q/Lw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1NDhiYmMyNGU5ZjY1YzNjMWIyMzU1NjhhYTkwY2NmY2FjMGJlNjlhMDBhMjgwN2Q0MDFmNzQ0NzRmMDkzZjcwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSHlrdjR0RFBJK2ZkSWlBVS9NaUo1ZnhRdFhPTUVxWkFOd3JmeFQ1UkVWNEFpQndNTWVQMVA1WitPS295RFlSR3lFVWNtZ2Z3U3BZUWxka0ZKQmN0N3dVT0E9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFSRU5EUVhvMlowRjNTVUpCWjBsVlNFZEpTQ3RGZW5SS2NFcEtaRWxVTkcxaFRFWlpiR2RyTVhOSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlJFa3dUV3BGTkZkb1kwNU5ha2w0VFVSRmVrMUVTVEZOYWtVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZLUW5KMFdHdDNTa05sTjFGeGExZGtPRVZSUTFkT05GbEdRUzk2ZUhSSFlrWlRSVzRLT1d4MVRreHNNbUpQWjFjNFkyWkdObXB0YTIxc2FHTkxXV0ZNTkhSVlNsbEVPRUU1UWxkTUwwSndNbmRWU0UxTlQyRlBRMEZzTUhkblowcGFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZQUlZFdkNuaFhhWGhWVjA4eEwwOW5OSGMyVFdRM1lVNWtUek0wZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMGRLYVU5VVJtcE9SRTVyV1RKS2JGbFVRbWhPUkZKcFRrZEplbGt5VFhoT1ZHczFDazU2VVhwWmVsVXlUbXBDYWxwVVVtcE9WR2QzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXdEhRMmx6UjBGUlVVSXhibXREUWtGSlJXVjNValZCU0dOQkNtUlJRVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVUZCUFMwRjBRVUZCUlVGM1FrY0tUVVZSUTBsQ2NGaHBNbEpzYjBzNFUzb3lNemRTUTFsdWFscE9TSFJ1Unk5bmVreFBaMWRVWWpNM1YzRkZTM1ZzUVdsQk9DOTZiemMzYWtacVVETm9SQXBUYm5oSWVIbFNWSGgxVkNzMlowdFZkekl5ZUZRMGNHUlZSelJUTVVSQlMwSm5aM0ZvYTJwUFVGRlJSRUYzVG05QlJFSnNRV3BCVm01R01rc3lTbW8wQ2xSRGVFUnFWekoyU0RWMVkxWndiM0F4ZEZsaGIySk9NM2N2VDBzclExVktRbEpLTmxVdlkzcDJSMk0wVFdseGNFTm1hV0pRUkVsRFRWRkRWVkVyUTJJS1JGQnRWMU5HZGpCRGMyUlNZV3hsVFhrclltWm9ZMUE1UlVwa2VFaHdWWEJFY214V1lrSndjVGcwT1VscFVrVjFOMll2ZERrcmRqVkpZbEU5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1665628944,
          "logIndex": 5000361,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "bb91c43dcbea0a44b4b3cc1599743c5660ce4c58",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3239304644",
      "sha": "bb91c43dcbea0a44b4b3cc1599743c5660ce4c58"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

