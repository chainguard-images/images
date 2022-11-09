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
| `latest` | `sha256:6e983aa1c920c1aebfc31f13ebb483fc0b5443d45e18525c8f347e47675b9d41`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6e983aa1c920c1aebfc31f13ebb483fc0b5443d45e18525c8f347e47675b9d41) | `amd64` |



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
        "docker-manifest-digest": "sha256:6e983aa1c920c1aebfc31f13ebb483fc0b5443d45e18525c8f347e47675b9d41"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "c027923bd7c832a1e0783673e860518a27e92ab5",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCLFx3gZ3fhsQC7znmCzoISWQRIoQM6bro5cUbNqsOeDQIhAKozyjSuxH1UngDICb2k+1ntXufewKuRYiskfM0ktBvb",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0NWMyODg4NGJjNmI1ZDkxZmVjYTEzZTNmMGQ1ZTQxNzY2N2QwZjZiMTZiZGY5MWE2NTIwYTYxOTgzYzUyOTdiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJSGZUc0dRb0pHcndsaXZzLzd3dDNTL1pDZ0xsWldIbDUvR1hnbENSUGxEMEFpRUFtVDkvK0NNdjZHMVBFS1BMQXEvMnpLc2kwMVZUVlU2eW9kTjB5d2w5Z2lBPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFha05EUVhvclowRjNTVUpCWjBsVllVRXhabFJpVVRObE9XdFpWelZ0ZUVaa2FHWmhjblZuTWxKQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRWTlJFbDVUa1JSZUZkb1kwNU5ha2w0VFZSQk5VMUVTWHBPUkZGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZRTVVkc1VHRkZTSGN6WVVjck5FUTVPSFp2YVRCWWJtMDFNbkJrZDA1eVdXOTRja1FLYXpSVWFVZzFOVVp1ZG0xMWFqUXhlVU5PYkhVMUwydHFhRkV3Vkc1R01HZFJjbFpoVVRsdVMwbEVOR0l6TUZBeVNYRlBRMEZzTkhkblowcGhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV5TjBVMkNrUnlhUzlRYzNsdlYxcFpXamMzYXl0TlNrVndVM1pWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMGROZDAxcVl6Vk5hazVwV2tSa2FrOUVUWGxaVkVac1RVUmpORTE2V1ROTk1sVTBDazVxUVRGTlZHaG9UV3BrYkU5VVNtaFphbFYzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXOUhRMmx6UjBGUlVVSXhibXREUWtGSlJXWkJValpCU0dkQkNtUm5SR1JRVkVKeGVITmpVazF0VFZwSWFIbGFXbnBqUTI5cmNHVjFUalE0Y21ZclNHbHVTMEZNZVc1MWFtZEJRVUZaVW1GT1JGSm1RVUZCUlVGM1FrZ0tUVVZWUTBsUlJIaFhZV1kwVEcxaWMyVkJaME5zTkdKc1dXWjFVR0V2ZEdKaFFrcE5PVTlDVW1ObVQyWnlZbk5NWm1kSloyVTBNM2xYTVhkbGVFeHZhZ3BNY2xOUWNuSnNkSEU0TUhSb01uWkJiblZ3WXl0c1pGTXpkbFJEWW04MGQwTm5XVWxMYjFwSmVtb3dSVUYzVFVSaFVVRjNXbWRKZUVGTVRqUlVTSEZtQ21remNTdEhMMlJvUjA1aVNHVm1UVVpyYm5WbGNUUXlNRk5MUlZkeVluRldhVTlGZW5kM1IzSlNObEppUzAwMVdERk5MMUJSUmxwTE1YZEplRUZMVG5jS1IwcDZWSGM1UldKalFVNHJTVEpvYzNwTWFYUjBORTFDVUVWakwycHhiMU4xVkhaR1EwSmxNVEpZYkRodlNrWndhbmxzT0cxdkwyczFjU3MyWjJjOVBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1667960688,
          "logIndex": 6759127,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "c027923bd7c832a1e0783673e860518a27e92ab5",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3424832573",
      "sha": "c027923bd7c832a1e0783673e860518a27e92ab5"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

