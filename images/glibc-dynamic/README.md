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
| `latest` | `sha256:eb0a4d7ac71c8984f3f68a70e73b55ac375a7e955bfb9a4584c49e0bea630d7c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:eb0a4d7ac71c8984f3f68a70e73b55ac375a7e955bfb9a4584c49e0bea630d7c) | `amd64` |



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
        "docker-manifest-digest": "sha256:eb0a4d7ac71c8984f3f68a70e73b55ac375a7e955bfb9a4584c49e0bea630d7c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "7f404afaf961d5c13de2257c9d6547d29c2bba9a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIAydtHiY8dqXBY4Jq+bQK/5kYoibmTOnHM441eJ2LIooAiBBEaFJ/hyXTCMMuLJsIKvXxRN9V4Ejqi4rJMYmLenQxg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2MTk5YzAxNGU0MTdiZGFkNmY2MjdmNzY1NTNmNjRlMmMwYTFmMTA2NGVjY2Y2MWQwMTAxYzg4NDJiNmMwNzFkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURCRUpzNUp1eXEwVHF1MXduT2pkL1ZBeTNHYUdJTENENUpsQzdCQVVaWExRSWdTSzUxT0dCU2xZRk9RazdodDNKNXZxbE8wSnNHR3hNSnIvU2Y3Q2dGUmhZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFWRU5EUVhvclowRjNTVUpCWjBsVlQyTmtkSEpoU1VsUmMyUlJPRlpWTm5NMVFsSnlXRnBhUWpGemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlROTlJFMTNUbnBCZUZkb1kwNU5ha2w0VFVSRk0wMUVUWGhPZWtGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZGUml0U09HWTNOa1ZNWWs1alMzUmxhbTk1VGs5b1NFSTJhRkpTUnpkcGVGb3pkMlVLTUdvelpVNXRTbXRXTjJseFRtWkNVV1pPVTJFeVNWWkZhSEZMVmpaUWVFSnlWWGNyTVRkQkszQnFTeXQzTVhOUlptRlBRMEZzTkhkblowcGhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV6V1dKWkNrdHNZU3RUWnpVclRteHpNek5yU1dNMk5XbEVOMUZqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJrYlU1RVFUQlpWMXBvV21wck1rMVhVVEZaZWtWNldrZFZlVTFxVlROWmVteHJDazVxVlRCT01sRjVUMWROZVZsdFNtaFBWMFYzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXOUhRMmx6UjBGUlVVSXhibXREUWtGSlJXWkJValpCU0dkQkNtUm5RVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVUdvMlRFdHNRVUZCUlVGM1FrZ0tUVVZWUTBsUlEzVnZhMmxpWVdZck5UaDFlVmhtUlhadWNubFBia3BqY1VwV1JVaFVlRmQ2UW1ocU1YZEpObUpsVWxGSlowdG5RVWx1Y0hWR01rNVJOZ3BYYm5GV05ISnRXSFV2V1cxcE4zWTROMUpuTWtrMmJVSlVRbE5oTWxsdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFVSaFFVRjNXbEZKZUVGSlIwVkZSMDFRQ25relp5dGFkRUYxYkdWc2RrY3ZTMmRGWjB4cFpqSkxVR2M1ZFRobWJFcFZORkpuWjB0dlJucFJkSGg1Y3pWRVRXaHBWVmQzV2tRMFFYZEpkMFU1Y1d3S2RXWnVWVGRWTVhWa1EzZEZPSFV4YTFaU1UwVnZXVUUwYVd0Q2RFMHdaMk5YT0Voa1JUZHRRMFYwTWxKRU0zTXhkakExVUdGTVUwWm1iakYwQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1665976028,
          "logIndex": 5251952,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "7f404afaf961d5c13de2257c9d6547d29c2bba9a",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3262076915",
      "sha": "7f404afaf961d5c13de2257c9d6547d29c2bba9a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

