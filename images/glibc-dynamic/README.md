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
| `latest` | `sha256:a5fbd95f306c2cef9fc78108fb70a6e32fe3c7798df6018b62d50926d60cfdef`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a5fbd95f306c2cef9fc78108fb70a6e32fe3c7798df6018b62d50926d60cfdef) | `amd64` |



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
        "docker-manifest-digest": "sha256:a5fbd95f306c2cef9fc78108fb70a6e32fe3c7798df6018b62d50926d60cfdef"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "60835e8277dbdac675734cc9dc43001975c6096d",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIAhoktqxrd4+1d1lwWnynDlckxC8+dMK/Ex2sWM+P7v3AiB/9tcvG7CpVluFq2ujfd9bD/BuEu1KMP95CIFr8XwxkA==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkYWY4Y2M4M2FmY2JhMGZiNjBmNjZmMTE5ZTYxYWQ5NmRkNjgzODMzMTdlMzVjODFlYTg2MWMzNjFlZTA3NDcyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURjRGpHWjF0M2E5U1BuVkxaSHdsdWlpMGhVZmNFUUZQbmJFdHh4WEJ0aTFnSWdZM0pIRVo0Z2N2NU9YVi84N1l4SWpzcERRTGJGSXpWMFBCN3BoUjg0Q2VzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFha05EUVhvclowRjNTVUpCWjBsVlRsSlJTbVV5ZVdwa1VWQmhiRkpMTjFNelEycDVhWG8yZFVOVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRKTlJFa3hUa1JOZWxkb1kwNU5ha2w0VFVSRk1rMUVUWGRPUkUxNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVU0YkdoU2NFTkVXbVpFZWpoUFYwMWhXbXMxYjJsTFdFOUlkaXQ2WlU1M1FXRkNaelVLYjBsSGRGcGpiR1U1SzJ3MllUbG9jblp1UW05cU5saGlUMk5qUlZSNU1FMHhjV0kxVEVoSWNtZ3JXSGR5VGs5VlYzRlBRMEZzTkhkblowcGhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZQVlhsWENuUnpNRnBDUVRablVUWnZLMFJKUVVFd2FqbHFRbmROZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJaZDA5RVRURmFWR2Q1VG5wa2ExbHRVbWhaZWxrelRsUmplazVIVG1wUFYxSnFDazVFVFhkTlJFVTFUbnBXYWs1cVFUVk9iVkYzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXOUhRMmx6UjBGUlVVSXhibXREUWtGSlJXWkJValpCU0dkQkNtUm5RVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVUdWMGRYWTFRVUZCUlVGM1FrZ0tUVVZWUTBsUlF6SjRaV04wWTJSWlYzSktPWFJRYUhoWWJUUm9NVzU1WkZJNFdURnRiVVJaWVVSSU9ITkZkUzh3UjFGSloyWjVhM1F4ZG5JelRuaFRlZ3BGU3pOTFptdFJOM1JSUWxWaGRFaHNiVFp2WkRkR1F5dHpjR1JpVUVSdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFVSaFVVRjNXbWRKZUVGTVV6VlJiMHRZQ2xoVE5IZHJjbk5qVUdGVlpsWkhTVkpHWkdKdU5VWXdWamhYU1RCSU9HNHJZV1ZoYURseVluSlVPWEZXVUdKTGRtOUxRMVE0U1dObWVYZEplRUZLV0ZRS1oyWnJXbXBtUXpsS0szWlpNRTFoWjFoUldqYzNlRkUxWjJSa2FHdG5VRGx3ZVU1QlR6STJVMUY1TVZKWmJYVmtkM2RTVkdoMlkxaEpTM0l2VjNjOVBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1665888876,
          "logIndex": 5192078,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "60835e8277dbdac675734cc9dc43001975c6096d",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3258019322",
      "sha": "60835e8277dbdac675734cc9dc43001975c6096d"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

