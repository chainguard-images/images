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
| `latest` | `sha256:5f9e611d9f66098f2f3feffded934072660578f84e08b95c7dc9ccc6dce2ecd4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5f9e611d9f66098f2f3feffded934072660578f84e08b95c7dc9ccc6dce2ecd4) | `amd64` |



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
        "docker-manifest-digest": "sha256:5f9e611d9f66098f2f3feffded934072660578f84e08b95c7dc9ccc6dce2ecd4"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "a377c448fdd62fa9fff6f6ebe7ebd50ac82b93f3",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIE7VeP7uNw17EFhGZ1R97lStQrR855FRgpxgdijwy0RiAiEA5mtBO6gwMs6RvEe4oG/8crLWJrNm9NsftmIMNEBWfu8=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5YzcwMjkyMjA1NTBlYzg5NDE2MmVhNzc3YTNjYmUwYjQ4M2Y2NDVhMTlmYmEzZGI3YTBlYjAxNmNlYTFjM2FjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQW84OHM1a3dyeHpYaXhmRTFQYkluMllDMTlWbnNtNS9lV1laaUFQQXRwbEFpRUFvaFBYN3FvSlhmbFcvTVprQ3dXSE9yQXNVM1QyOUZiSzRDUlc0VjBjaFlNPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFSRU5EUVhvMlowRjNTVUpCWjBsVlZGSlNSM2RGUzBKYVF6ZHFaMDlXUTBGak1tOHZRakJEUmpaVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFVFhkTlJFbDZUMVJCTlZkb1kwNU5ha2w0VFVSTmQwMUVTVEJQVkVFMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZrV2preVptSktSWFE1UkRCUVIwaFdWRUp5YlRNMVExVkhOazVrT1hkcGFXTlljSFFLUW1SM09UWTBiVkpVVEZsdWRteHdVbkU1VG1SblpFdEZabk1yWlhaMVJFNUZSSFUyYzBkSVkxTlJaek01THlzeFIzRlBRMEZzTUhkblowcGFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZUYlU1NUNtcGFVVmRsTjA5MWJuUjBiU3N4UVROVGFVcGpkM1EwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMGRGZWs1NlpHcE9SRkUwV20xU2EwNXFTbTFaVkd4dFdtMVpNbHBxV214WmJWVXpDbHBYU210T1ZFSm9XWHBuZVZscWEzcGFhazEzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXdEhRMmx6UjBGUlVVSXhibXREUWtGSlJXVjNValZCU0dOQkNtUlJRVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVVcxM1pHOXJRVUZCUlVGM1FrY0tUVVZSUTBsRlNUWm9WbEpKVXpaSUsxRm9NMmRKVUZZd2JEaFdWVzlQUVRWU1NWY3JjVGxXUTB0dWNtRk5aV3hNUVdsQksyUXZlVFUzWldKcFdIQTFaZ3BvUWpKaGVXSnpUV3AyTm5kU05WVTVWa042UjJkUVVrNUxRbmhWTjFSQlMwSm5aM0ZvYTJwUFVGRlJSRUYzVG05QlJFSnNRV3BCZERSU1pXWTBaVXRQQ2tKT2NWZEVNMFowVVhsalYySndORFJHU2xaYU1sRlhVa2MwU1U1bVpFNVpLMFJIYTNJMVpGWTFUbWR0T0RkR2JscFVia1IwYURSRFRWRkVTSFkyZWpZS1JscFZWM1Y1YW5CM1VqZzNlbTVFYm5aRWVVUmFZalZLTDJKU05XTkxXakpRZFdOWGFHODRiM1ZvTkRSNFNUWnZhVlpqUXk5NlJGWktXRUU5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1667097552,
          "logIndex": 6136388,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "a377c448fdd62fa9fff6f6ebe7ebd50ac82b93f3",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3353815049",
      "sha": "a377c448fdd62fa9fff6f6ebe7ebd50ac82b93f3"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

