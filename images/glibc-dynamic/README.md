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
| `latest` | `sha256:fe89ec0aa46805a14867f3dfdd8d4b827489c121a9a1430882310dfd48c344b8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fe89ec0aa46805a14867f3dfdd8d4b827489c121a9a1430882310dfd48c344b8) | `amd64` |



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
        "docker-manifest-digest": "sha256:fe89ec0aa46805a14867f3dfdd8d4b827489c121a9a1430882310dfd48c344b8"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "3d3b7fb58303088be7ce35045e337fa023b5a7dc",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIAtgmSZa+s77ZIrPmf75nhTt1mNt5ms3CNIAHymbyG5eAiBBZmYY8+VdyM24zcvx+zNwYnEZD3sYN4JGovz4UNhIWA==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxMGE4MGI4YTYyOTg0NDgxMDZiZWQwNDljYmY4ZWU5ZmUwMzRkNTdkOTU0ZDljYmVlYmQ2M2FmNzBmNTllOWFmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRTRvcGQ4UkFubnB1b1I4eXBZSyt4TkFqMDBEd2NYSi80dWxIL1hIdjlHSUFpQTdGZy90bFM1bXpVOWNzZ0tVSUJ0WGlzUVFiSDZKVXZaQXdpRXlBWjc3K0E9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFha05EUVRCRFowRjNTVUpCWjBsVlVtRnRSR0Z1VkdFdlNVZHBkVkYzTVZCbFoyZEhTalJSY1V0VmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUVRSTlJFbDVUVVJGZVZkb1kwNU5ha2w0VFVSQk5FMUVTWHBOUkVWNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUyU1djM1Mwa3llR3h5Wm1ZeU1GQllSblIySzBoT1EyRnJaM05KWVRCelJYaEllVlVLY2tFdmNrSjJWVXBvVGs1QlNrUmplVmhzTTJSaVVuZGlLMndyU1hWM1ZYZFpTSEJHZFdaM1QzaHdTMVJvVGtWV1RYRlBRMEZzT0hkblowcGlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ4Tm01bUNqZHNTVzluV2xObFVtTXphMDVpTVVWU1NrbElhWEZGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJPYTAweVNUTmFiVWt4VDBSTmQwMTZRVFJQUjBwc1RqSk9iRTE2VlhkT1JGWnNDazE2VFROYWJVVjNUV3BPYVU1WFJUTmFSMDEzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldYTkhRMmx6UjBGUlVVSXhibXREUWtGSlJXWlJVamRCU0d0QkNtUjNRVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVHpGYVNuQXpRVUZCUlVGM1Fra0tUVVZaUTBsUlF6TkpXR3QwVkd4V1lXcDZVblpHY0hJeVpVMU9jM05LUkdoSGFHTlRVVzlFYlRBekszTXplbmxLUTJkSmFFRk1SMVYzT0ZKVFp5OHhRd3B4TUhwVk9HSndZbFJ1WlVOMWIwNVhlVXRyU0RsaUwySnpjVWxSVlhCMVRFMUJiMGREUTNGSFUwMDBPVUpCVFVSQk1tZEJUVWRWUTAxQ1kzSjFVMVpDQ2pOUmFrUnJLMGMxT1U1MmFVWlhNR1oxVDB0NWMwZHJOa3hhWnpWNmFrMWtRWE5ST0dReE1qZGxiekZaUWxwek0wNU1jM1JqY1hKRldsRkplRUZMTms4S05XVXpjM1J1Tm5kRFF6aHdla1kwTDJsaGFFUmxWRE5hUjJSQlQyZHJPWEUyS3l0S0t6WjRhbkJsTVZSc1QzWjNLM1owTjBJMVNFNDBOVnBUWkdjOVBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1665195617,
          "logIndex": 4668169,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "3d3b7fb58303088be7ce35045e337fa023b5a7dc",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3208784104",
      "sha": "3d3b7fb58303088be7ce35045e337fa023b5a7dc"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

