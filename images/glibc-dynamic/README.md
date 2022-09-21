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
| `latest` | `sha256:2555e59d9f77a2c0aa3b8842e6b72c0cd339dd05c507aaf03748b9962586a1cf`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2555e59d9f77a2c0aa3b8842e6b72c0cd339dd05c507aaf03748b9962586a1cf) | `amd64` |



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
        "docker-manifest-digest": "sha256:2555e59d9f77a2c0aa3b8842e6b72c0cd339dd05c507aaf03748b9962586a1cf"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "6662ed0809ca8234a0dfcb6db756370f2a51fabf",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIB0M1eVrQUTbIaXq1qF6yNz3ja38kDVe6FZI8RZLWxuMAiAHUgY0ym9VW/YoxtC+GJRCR1uGtuBgNobKpJzB3c/HlQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjZGZhNTI1MmVlMzExN2ZkZGYwMGUzNGQ2YzIwNzBjMjc1OTY2MjA0ZGQ0NzEyZTJmOTE3MmMyMTE1NGMxZDAyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJR3ExazJhcTkwZnpaUU01TmxDTi9lWitpQXExSCt5SFoxdGZVMHpJQVRsSkFpQU0xVE1KSTVyMzhFaTJ2Ly9teS94NTFwa0lsV2hjZ1ZEOHlnN1c2WGZyWUE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFWRU5EUVhvclowRjNTVUpCWjBsVlVHbDRiVWxqUVZCM1IyNUZOMVJTWm1WTGQzVlBlWEowVFhCemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hoTlJFa3hUV3BWZVZkb1kwNU5ha2wzVDFSSmVFMUVUWGROYWxWNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY0WlZBNFRWQnFVMGRTYlhBd1VIVndUMGRNVlZWT1MxRTJhVUl2VVZsUk1GUnBhbTBLTlZOS2FHODFOakJsV0VNMk4xSlNiMmRwZEZKdVZuaG5TMjVxVEU1UlRESk5hbGhQVWpKU1VXZFZiRmhvTTNaRmJVdFBRMEZzTkhkblowcGhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZHUkhWQ0NqSlJPVVpoVlROdU16SnBabkYyYURSck4zaHVWMmxyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJaTWs1cVNteGFSRUUwVFVSc2FsbFVaM2xOZWxKb1RVZFNiVmt5U1RKYVIwa3pDazVVV1hwT2VrSnRUVzFGTVUxWFdtaFpiVmwzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXOUhRMmx6UjBGUlVVSXhibXREUWtGSlJXWkJValpCU0dkQkNtUm5RVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVG1RNWJXTkVRVUZCUlVGM1FrZ0tUVVZWUTBsRU9VRm5WWGxoUldkalNsSkhNM1l3VFdkalFWZHRlVFoxTld4NlUzaDFUVk4xT0VNcllsTk5WMmRKUVdsRlFUZE1LM1l2U2pWd1dFNUhSd3AzTTNwT2JUZHZhM2xtYkVwSFNEWjRiREozTUV4UFJtdHZjMEpWYTFoRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFVSaFFVRjNXbEZKZUVGUE0wdGliSEZxQ2xaYU5GTTRSamxoUVRSME1tZHJXR0ZtTVVSM2NXaEpPR2RwTm1odE5VcEZPVXAzV1U0M1RIZHlUbWxOZERBck16ZE5VWFJhTkhoMVFtZEpkMW81VUU0S1pFUlBTSGxOTjJkVFRVWXZjVXRhTkZjdk1WUlBaVUppYVdKTlRVeHZMM1k0TDFKcE0zb3lXVWRoZUVGSGVVNDJRbE5wUjNGNmJHbHBaVm8yQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1663728775,
          "logIndex": 3646938,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3094872814",
      "sha": "6662ed0809ca8234a0dfcb6db756370f2a51fabf"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

