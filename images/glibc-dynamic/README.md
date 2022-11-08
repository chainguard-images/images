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
| `latest` | `sha256:89e96980d1507ec9db6afaa3877b1f5653f04359d8b1c7050189ae00049b11d4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:89e96980d1507ec9db6afaa3877b1f5653f04359d8b1c7050189ae00049b11d4) | `amd64` |



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
        "docker-manifest-digest": "sha256:89e96980d1507ec9db6afaa3877b1f5653f04359d8b1c7050189ae00049b11d4"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "56c496a1ac6ed243ab5afca4c984de5f3c98c197",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIBnkElHlc4GfZAbNfAboGqx2ojjms36p1vE2y5nofEiPAiBy+LIXlIEPTsbsYdJ7C7HdJBi7nnq3zMs5/9QsJcz2rQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4NWJiNmZiNDY4YWRiZTRiNTEwMjFmNjU0Y2Y0ZDA1NGZhYzIzOGIyZDhkOGJmMTVhNzIxNTYxMjQxODE5MzAxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQzQ1Ujc2NmFzaCs4cDNFSk4rTVNmaW45cmNob3BTOU9TN3lUSldxTjZVa0FpRUF0Rm9aUkZ4SmFkc20xd2dCZGJJSmZNbEdDSFRWUjBJNmFyVXZLSm5ZTWQ0PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhweFowRjNTVUpCWjBsVlEzRkhXVk4wTVdJd05VWnNSbUkzWTBwWUwzcEhZMnMwWjFkcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRSTlZFRXdUMVJCZDFkb1kwNU5ha2w0VFZSQk5FMVVRVEZQVkVGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZvWnpWM2NGSjZWRXBKWkVGRGNXWjBjU3RaWTJOaE5Hd3ZOWFEyVFdoSGFuVlJWMjRLTUhGalNtNXpWRVJhYUdnNGF6VjBSa2d4YWxJMVVtTjFTM0JPUzI1UlNHZHljSEJ5VjBWQk5sbG5TVUpqTkZoV1FqWlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUwVEM5dUNtTTFiR2w1UlRWb01uaDFWSEp3SzNoTVpYSkJNVzFCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDU1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUWtoQ01RcGpNbWQzVG1kWlMwdDNXVUpDUVVkRWRucEJRa0YzVVc5T1ZGcHFUa1JyTWxsVVJtaFplbHBzV2tSSk1FMHlSbWxPVjBadFdUSkZNRmw2YXpST1IxSnNDazVYV1hwWmVtczBXWHBGTlU1NlFXTkNaMjl5UW1kRlJVRlpUeTlOUVVWRlFrRTFSR050Vm1oa1IxVm5WVzFXYzFwWFJucGFWRUYwUW1kdmNrSm5SVVVLUVZsUEwwMUJSVVpDUWpscVlVZEdjR0p0WkRGWldFcHJURmRzZEZsWFpHeGplVGx1WWtkc2FWbDVNV3RsVnpWb1lsZHNhazFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFWmlZbXBqVVVGQlFWRkVRVVZaZDFKQlNXY0tRV1E0VlRJMFFuUkhLMWd3ZFd4TFltbE5kR0ZsZURVeGR6UmtSMnhQTHpGSFRpOWpjRmhXV2t4SlJVTkpSRzEzY21nNFF6bE9RbVYzTnk5UFYwVTBVUW8wV1ZKVlpXVjBkeXQyYURkTFdXdGpjbU5YVjFGMlpuWk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSm5RVTFIVlVOTlNIaFZSWHA0V0ROeVJsSlpTR1pPQ20wd0wxUlZWSGhHWlhKdlZWSmxhV05yYUdkRVFuZFFPVmxqVVhKdFdVaFZRbTFPUVRSaVQyWXJPWFZwVm1GSWFEaEJTWGhCVERJeFEyWnNibVJQY1hvS1RtcGxiWE5tWkdkUlNIUkhlblZFSzFBMFF6bEJVRnBHZUZsM1JITkNSSE5EYlVGRFlrcHpUWFpLUlRObGJFcGFhbVJPVUhGUlBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667904545,
          "logIndex": 6721026,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "56c496a1ac6ed243ab5afca4c984de5f3c98c197",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3418677824",
      "sha": "56c496a1ac6ed243ab5afca4c984de5f3c98c197"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

