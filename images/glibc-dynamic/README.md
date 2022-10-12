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
| `latest` | `sha256:5393284d6b4c4ad44231e98dc771e57eb041c8e40e0c468d326778099f993c76`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5393284d6b4c4ad44231e98dc771e57eb041c8e40e0c468d326778099f993c76) | `amd64` |



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
        "docker-manifest-digest": "sha256:5393284d6b4c4ad44231e98dc771e57eb041c8e40e0c468d326778099f993c76"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "0c57a337b30ddef2fd001be5d1d62258f51ea912",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCYzQA9ZARJ8HC3crEMC5k2kQF81agVq4oqgM0quA9uTAIgURVYzBhLBo83jdlY/s7q0RqGQuSeL76MJhFKIWj93Xc=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlY2FhNTcxOGEwNDEyM2U0NGE0Njk2NmUwNTIxMzBmZmE3MGExMjVmZTUxN2QwZjUxZDM5Mjc1OGI4Y2U3MDExIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNuYWVBN3lOSEVWUzN4K1ZiVzZiVS8wR3BORGNKK2VjYXNsNHZTVElibHZ3SWhBTWR6RU1Ha3BIUDdLSFVCZFJZcmtUTFlYWE1yaFdSL2VSM1NaeVlCL05oOSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFha05EUVRCRFowRjNTVUpCWjBsVlFuQmFjamhXZUVkRWJUTTRTRlpoUVZNNVNEbHViVmt6Y21SVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhsTlJFa3dUMFJCTkZkb1kwNU5ha2w0VFVSRmVVMUVTVEZQUkVFMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZCZVd0SmExZ3pWREJYWm5sUWFUSXZSV1ZZVVcxcWJuTnRXVzFrUzBOa1luaGlkWElLVDNaeWFucDJlRTFMZGxoSFZXZFFVbXBITTI5NmFVRlNOVXR3WVhNMWFUQkZXRTFsVEZkc1FYUTNiMUJGTDJrMWQyRlBRMEZzT0hkblowcGlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZYY0dKTUNrdGhTSFI2YUhaS2NsaE9OVWx4YkhoSU9FSXZSV2x2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJDYWs1VVpHaE5lazB6V1dwTmQxcEhVbXhhYWtwdFdrUkJkMDFYU214T1YxRjRDbHBFV1hsTmFsVTBXbXBWZUZwWFJUVk5WRWwzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldYTkhRMmx6UjBGUlVVSXhibXREUWtGSlJXWlJVamRCU0d0QkNtUjNRVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVUV0R05UQjFRVUZCUlVGM1Fra0tUVVZaUTBsUlEwWXZTR2hCU0VabU1HTkRia1pxVVVORVdTOTNjamxQT1dJeWNITTFhMk53VldKRk4ybDNSQ3RsY1VGSmFFRlFVWEpXU1RaRk1reGplUW8zYVVKMmFWcHpkbXRaY2xSdlFWVlRlR05OYldWQ1JIRnFUbWhHWmpOT2NVMUJiMGREUTNGSFUwMDBPVUpCVFVSQk1tZEJUVWRWUTAxSFVYQkZZMjlYQ25aQ1JGZE1WM1JxY1U1NGNrTnNPWFpUYUVKWFRsaHBPREYyVFdZemNEbFRSVVpCZW5BMGNsTldWV1ZXV1dNM1RtRXZNMFJFU0V4dWNrRkplRUZQVm5rS2VTODNNVlJSYWxvMU1pdFBXRlZpS3poVGFYSlFVbkpEUkVOUVlqUTVSV2MxZVZKVlZtdFFVVWRuUzNkSWNFMUdSRnBKUlRRclRWRXZZMUZqSzJjOVBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1665542893,
          "logIndex": 4935138,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "0c57a337b30ddef2fd001be5d1d62258f51ea912",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3231661197",
      "sha": "0c57a337b30ddef2fd001be5d1d62258f51ea912"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

