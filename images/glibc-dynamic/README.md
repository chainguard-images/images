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
| `latest` | `sha256:2af5836304cc8c4c9bc6babd2103ff1c2fb9a20ee781c88f9ddb1a84c2a782ce`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2af5836304cc8c4c9bc6babd2103ff1c2fb9a20ee781c88f9ddb1a84c2a782ce) | `amd64` |



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
        "docker-manifest-digest": "sha256:2af5836304cc8c4c9bc6babd2103ff1c2fb9a20ee781c88f9ddb1a84c2a782ce"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "a5b963eacd2704b3e5c84860f01e10e0115c9984",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQC/q9joFlNgGVyakl+wT9NSnID0ngplNIuCM2nBfQhoOgIhAP+rB+xpJrqNXcF6Y3XtyEfCOp1++vxfWHKf1Lct45uw",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0ZjVjYWI0N2FhZmJhZDc4MzUyZTQzMWVlOWNmZTQ5YTJhMDgzZjI0YTc1NjAzOWFkYTljNWIzNTY4NGUwNTRhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURiQitIK2dTaHNkNjZuZGpuQ2Rmd2dnMUdUREM4eW42cFpTQi94b3F2c21RSWhBTlVmTlNOMXZMMFJmclYweXFJZWdOOGUwSjZhNzY0YWdaa1RIQU1ua2ZiSSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFWRU5EUVhvclowRjNTVUpCWjBsVllUWnJaakpHUlcxRVNsZG5RM3BQVlU5eVEwRk1SMUIzUzJ4amQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRCTlJFa3hUWHBSTVZkb1kwNU5ha2w0VFVSRk1FMUVUWGROZWxFeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZUVTJaeldURlphWE54Y0VSSGRsZ3hNR2RhYXpCdmIyRlVaazFTV2tFMU5sbGFTMW9LTm1sdlFsWktTVmRTUkc5d1dFVlhPREJqU1ZGUVRIbHVaVUYwWTA1RU56VjBkak5pZEZveGJGSlFVbXMyVTFKc1RIRlBRMEZzTkhkblowcGhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ4VDJWbUNsTTBPRE5uVFZGRVlUQjROSFJTT0ROTlpXdFZRMHM0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMGRGTVZscWF6Sk5NbFpvV1RKUmVVNTZRVEJaYWs1c1RsZE5ORTVFWnpKTlIxbDNDazFYVlhoTlIxVjNUVlJGTVZsNmF6VlBSRkYzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXOUhRMmx6UjBGUlVVSXhibXREUWtGSlJXWkJValpCU0dkQkNtUm5RVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVUZWaFdHbEdRVUZCUlVGM1FrZ0tUVVZWUTBsUlJHRjNWbVl4TlRkRE4xWkhNekIzYWpJelRGQjRXSEpsYUdsTksyNXNlVzFWV0d0Wk9WRlRaSEJsUW5kSloxWlhhbTl1Um1SUE1tdG9XQW8wVVdObk1VZHZUSFJGTVVKSU1ERkxVbmxVWlN0M2VGUjFhSHBEZFd4SmQwTm5XVWxMYjFwSmVtb3dSVUYzVFVSaFFVRjNXbEZKZUVGUVFsZFdUeXN6Q214WVp6TkxZbll6U2xWdU1WWkJVaTl4TjBwV1ExcGhaMWRvYVVaRVdGWmpZbmh5UlZKUFpuTndUWGhpVkRFNFJua3dTR3hGYkVZeGQzZEpkMU5WVm1NS1NFSjNNbTFVTTFkSWVVUlVhak5sZHk5YWRpc3diVUpsYkZwT05pdDZjamMyZVhKcU5uaEpla0Y2TjJ3dmFubEZPVU5pWXpkSVprY3ZTbmgzQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1665716032,
          "logIndex": 5067150,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "a5b963eacd2704b3e5c84860f01e10e0115c9984",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3247117644",
      "sha": "a5b963eacd2704b3e5c84860f01e10e0115c9984"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

