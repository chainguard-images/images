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
| `latest` | `sha256:bef453834911b5e0675dab440e5c6a70027045d72b974140886023b4df6e21e3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bef453834911b5e0675dab440e5c6a70027045d72b974140886023b4df6e21e3) | `amd64` |



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
        "docker-manifest-digest": "sha256:bef453834911b5e0675dab440e5c6a70027045d72b974140886023b4df6e21e3"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "09cebc765a52c91082d840d08cbec1745404ec71",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCID/PMqKY7mv5NVamwmQnQ7aSlOJejqdgyxKzsgTBK+1oAiEA96zsTQU7U1klFH4XMjAWx6OvzPUkLMFhu0tDFAgBwQ0=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmNGJlYzg5MGZiNjYxZGY0MzNiYWI1NTNkMjhiMTg0MDdmNWU3Y2RjMDhmNTAxZmM2ZWNmOTljODMwMDNkOWNkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURFWHJ4K3NLTWRjQ1ZmTllGMFl6N3ZEN1pNclJVSmp5dmtVNlZkTytBZGZnSWhBTVo0L1h3WXdGaSs4QXZ5Uk8zUGpwZEtTYXNRZ3VDLy9Ld3dWN0ZzaE1wSSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFSRU5EUVhvclowRjNTVUpCWjBsVlVIQnJRWFlyYW10dWIwVkdla3hIYVRGTU5FaE5XRE5xYkdKcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRGTlJFa3dUMFJCZWxkb1kwNU5ha2w0VFVSRk1VMUVTVEZQUkVGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYzV0U5d1R6ZHRMMkpUVmtKdlJtOXpkRTlRUkZZMGNXNXZNa1pqU2xSclFsWjVlR1lLVmpsbVdWSjJSRWhHVEZKWlpXNHJiMjgxYUVZNFdUbEZaVFZ2UTNVMFJFNHdTV1JNTmpVNVNqTlJVbTR3TVd0NldtRlBRMEZzTkhkblowcGhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZuY0daQ0NuUlZkbUpLTmxwd1lWWXlTRmdyUXpKUlVUTkxVVEJOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJCTlZreVZtbFplbU15VGxkRk1VMXRUVFZOVkVFMFRXMVJORTVFUW10TlJHaHFDbGx0Vm1wTlZHTXdUbFJSZDA1SFZtcE9la1YzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXOUhRMmx6UjBGUlVVSXhibXREUWtGSlJXWkJValpCU0dkQkNtUm5RVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVUZwcGNEVkhRVUZCUlVGM1FrZ0tUVVZWUTBsRFFXNHZNUzgxYUZORGFrOXJLekpsVUV4VGFuaEhkWFUxTVRsdmNWZHFRbTh6UW1oNGIweENVRWwzUVdsRlFYcG9jV0pVYld4S2VVNHhVd294VERkaFVIaExhMDF5SzFsTlpVUjZhbVZNU0RGSFptRldOSGxDZEVvMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFVSYWQwRjNXa0ZKZDFKT0t6RkRZMFZoQ21ocUswWXlka1pwWVRad09FRnlRek0yUW5aQ1owcEdXRVZZZEcxSk1HZHVhVXhEVlROeFFXaG9USEoxWkVaMk0ybDRjemx3VDFjeFFXcENRMnQzZFVVS2NXSldUbW8zUWtncmF5OU9Va2xYVjNReFZGWlhVWGN2Tm5ORVEyTkdRVTlMTkZKb1JsSlJiVVJ6WkcxbGRuUjFXVTVWYWtKRldHNWxRM2M5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1665802087,
          "logIndex": 5131700,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "09cebc765a52c91082d840d08cbec1745404ec71",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3254150680",
      "sha": "09cebc765a52c91082d840d08cbec1745404ec71"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

