# jdk

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/jdk/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/jdk/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/jdk:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:041a061500c1f7332bf9f95dd2a179d46b4162b3123a3c17eb5a0cb7f0238a64`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:041a061500c1f7332bf9f95dd2a179d46b4162b3123a3c17eb5a0cb7f0238a64) |  |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/jdk:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/jdk:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/jdk"
      },
      "image": {
        "docker-manifest-digest": "sha256:041a061500c1f7332bf9f95dd2a179d46b4162b3123a3c17eb5a0cb7f0238a64"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ce14cd85bd2289c3bdc34638632e6eb20793b586",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCaS2AKxHozMeg8znHvvpnbqLFN064VFK7WEqB4VSI/eQIhANZW8Isq1ewYmBICVXeZ0fO4kHbR2hZ/tlTBo/MWUgM9",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzZTdlZjkyNjMxMDBmODBjZDBhZmM5MmU5NGY1YTM3ZGRmMmU2MDRkZDA1ZGE3NDhjMjdkYzI4NGVmZDI5YWQ4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNFU1NXZFk5WU9ibUZGS2wyeVhudzg0RVp3dFBOM0tFM3pnWXY0RVFZRUx3SWdFOTg4MHF3R21JNG00My9FNVhSZUg2T3BxTFUwdU04a2FGQWZycTB2U1N3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsMVowRjNTVUpCWjBsVlNIZFdTMnA2VWpsNVdWZHBURVZPYjFNcmRWVkZWbEpMTTI1emQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRWTlJFbDNUVlJKZDFkb1kwNU5ha2w0VFZSQk5VMUVTWGhOVkVsM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZIYVhOaGFrcGhNV0V2YUhveWFXaEtNbnB6WmtWaFdra3dZMjlZYmpOS2RqTkhiMmtLYmtKSk5rUlpXWFJ1UWxrMVNXRkVURVJDWjFGYU9IQlJSaTl2UkhoTVUwaHVVazVrVHpKcWRqTXJWWEZ6U1Rob2JUWlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZOVUZKVENtczRSamxQY0dVNWFXMU9kVGRMUzBaUlduUkZaM05SZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldUSlZlRTVIVG10UFJGWnBXa1JKZVU5RWJHcE5Na3ByV1hwTk1FNXFUVFJPYWsxNVdsUmFiRmxxU1hkT2VtdDZDbGxxVlRST2FrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUlZkb04xUkJkMEZCUWtGTlFWSjZRa1pCYVVWQmRrcGtVMlpDU1VNM1ZGWlBlSGxsV1ROVFpHZ0tNMUpuU1d4Rk5rcEJjMmw1TlN0aFJrWXpXWEIwVHpSRFNVRXdkVVpsV0ZoNVZFVmhSR2xqVlRJcmVrVmlUV2ROZW5OUVNYbDBXRVZWYURkbVNYbHFNUXByUjA1VVRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVowRk5SMVZEVFZGRUwwOXhOMWROS3pBNGQyOWhPRzVEV0RsaGVubDZlRFJWTmtWYWNWTjRhMU52Q2xwd0swd3diM1ZJV0ZwaWNtOUxSSEJvYldWUWVDdFFRVFp6U3pSeVNXdERUVUV4ZVdSNlpFeFdOME5yY25WVlN6RTVPRVJvUlVFNWVXaE9NRTV3V1dFS1VrNWtVa1ZhTDNCNGFYWm5SV1JZTmtWRFRYTkdXSGxIV21Zd016azVTWGcyZHowOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667959281,
          "logIndex": 6758356,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "ce14cd85bd2289c3bdc34638632e6eb20793b586",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3424718568",
      "sha": "ce14cd85bd2289c3bdc34638632e6eb20793b586"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

