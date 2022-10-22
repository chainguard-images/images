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
| `latest` | `sha256:219ae7b38e32aabb62aedad33fe41ae0c187509d115f1e10dffefe6a53844714`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:219ae7b38e32aabb62aedad33fe41ae0c187509d115f1e10dffefe6a53844714) | `amd64` |



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
        "docker-manifest-digest": "sha256:219ae7b38e32aabb62aedad33fe41ae0c187509d115f1e10dffefe6a53844714"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "47933b85917b9b72a8920f3b576c27bce83b8fe4",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIAzc8XWBFrHJq0tPSVembsx0HlN3StucBiWs8I36hntyAiEAtM1QTMq5UC14t2QDHciBmnApyvWaFTEDgGzNj4/jHck=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyMjY4MGFjNzM5YzYyZWY1NmU2OGMxM2VhNTZhYWVjMmRjMDM4NTczZmNmMmFjNGNlMTQ2ZDczY2UxOGU1MWU4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQzRROHJySlBxNm5LUVNuKzlVSzc1aTgzRzZIM2tiQ0x3alUzM3BpRStHREFpQkh4TTdyY1ovUzhWbVJaWWE3WTYxOWZjQ3h4ZlVvSjNJTWQwZVF5T0lGa1E9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFha05EUVhvclowRjNTVUpCWjBsVldGcHJaSFoxWjFOT05VeHJTblZsVkhKaWRrcG5Va1JQYkN0TmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hsTlJFbDZUWHBCZDFkb1kwNU5ha2w0VFVSSmVVMUVTVEJOZWtGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYzWkhoVWRtVXhaSE5KUnprNVprTmtXV3gxUWpGUmJYZEhkMjlzYVhJMFpFOXNaWEFLT0hOdFZGQlFOMjV4VjNwRmFuWndjMmxuVkhoeFNWTm9Xa2h6VTA5eFpYaGxjSFYzYkVWNE5HcHJia1pCY0hjMldqWlBRMEZzTkhkblowcGhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZCVlN0MENqZDBUR1ZHYVRKTlIzSXJRaTgzVEZCTFYwZHpjbUpOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJSTTA5VVRYcFphbWN4VDFSRk0xbHFiR2xPZWtwb1QwUnJlVTFIV1hwWmFsVXpDazV0VFhsT01rcHFXbFJuZWxscWFHMWFWRkYzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXOUhRMmx6UjBGUlVVSXhibXREUWtGSlJXWkJValpCU0dkQkNtUm5RVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVURscFZtWXdRVUZCUlVGM1FrZ0tUVVZWUTBsUlF6WjNUelZRVm1GSVQxQTNhM3BhTWtWQmJUTjNaMUE1UWprNVZqSnJNMDFUV1hCVVJVVkpVV3BIV0VGSloxWnRZMlZDVURFME5qWkhaUXBVVldReGFrMVdXVXR4VkhCYU9IVnpiRnBaVm14MWNGaHVTRWRsTm1WcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFVSaFVVRjNXbWRKZUVGT1IzWnlUVEV6Q2xSdFZWTnNkRFo2YTJodlNFOWtNemhCSzFKbllUVjZNVVp4VWtod01FTlhjV2xWYkVFcmIwTTJiWHBWYmtnMlNUSnRVbkoxSzNoV1RtZEplRUZQYmxFS05qbFlaRlJUYlRGaGJYb3pheXR1U1ZKTlVHcDFjV3RHWm1kNFYyMXBhemhyWTJ0NVUyRTNTblowVVRkMk5FdFlSbGxsZVUxcE1GbFFWM00zVVdjOVBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1666405984,
          "logIndex": 5612965,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "47933b85917b9b72a8920f3b576c27bce83b8fe4",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3301626203",
      "sha": "47933b85917b9b72a8920f3b576c27bce83b8fe4"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

