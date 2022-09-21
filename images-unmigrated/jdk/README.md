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
| `latest` | `sha256:a3030a5e374deddcaca8150a28ae6d1df51771c1cc13c7ce06792cfd0d057155`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a3030a5e374deddcaca8150a28ae6d1df51771c1cc13c7ce06792cfd0d057155) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |



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
        "docker-manifest-digest": "sha256:a3030a5e374deddcaca8150a28ae6d1df51771c1cc13c7ce06792cfd0d057155"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ceed27731383d27db2039c22a589b800da81b682",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEMCH1Pr42mk62dEldKjDNtv/msdFKLsgDxH5dspw1g8z1UCIDVCIgtNGnWINM7lgMAOGR0rjCMA2dkyGHiqrhxMQUFf",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkZDlkNzZjMmEyMzk1NWRiZmViZTgxNjA0ODEwZDBmYTNiMWJhOTMyYTc3Yjg1ZGM1NDkyZmFiZjI3YmJlZTU5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSC9oWE5QZmlGQm1rZVRNSHdJWElDSmdVR0o4R2ZVYnl3bk14OSt6S1JhK0FpQXJTYUlMUUN0TERPWFRYbXRySG5NTGF4TGNvcFRDbThyam5JRGxvdkEvbkE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsMVowRjNTVUpCWjBsVlNqZ3lTVzlDYjNFclIwcFdVbmcwY1ZCWmFUZHdLME5tU1cwd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hoTlJFbDVUbXBWTVZkb1kwNU5ha2wzVDFSSmVFMUVTWHBPYWxVeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZJU0VRclIxTnVieXRVY0ZSc1VtNTFUemQ2VDI1elprNVFWRlZUUzNCcFZYVTVhVWNLUmpKSkswRmtWa3RaWWt4SE5tTllZalJPTjNsQlVWZEdXVVpPYUhGeVUyWnZRMHMzYVhZek5FbHJWRTFhZGtjd2J6WlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZZTjBwaUNuRkVOa0p1VkZKM1lWazFaazFMV2twU1YyazNkV0kwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldUSldiRnBFU1ROT2VrMTRUWHBuZWxwRVNUTmFSMGw1VFVSTk5WbDZTWGxaVkZVMFQxZEpORTFFUW10WlZHZDRDbGxxV1RSTmFrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkZoa05tbHRRVUZCUWtGTlFWSjZRa1pCYVVGU1JHc3ZWazVKWVcxTWFtOVBZV04zWVZsVlVVNEtPRWhPYXl0bE1rNXJkSFE1VlVaMGRHRnhVVnBLVVVsb1FVNHlkRVZFYm14dGIyRmxNMDAzUlhkUVYwMW1NbmxZVFRSTFRHcG9ZWGxRTWtSUEszWmxSZ3B0YTFSaVRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeWEwRk5SMWxEVFZGRFQwUkxTMGRtVFVzeFNHNW9UbTE0TjJ3M2JDOHlNVlZWVTJSR1pGaGthR3BIQ25obFRWTXZTa3hHTTJVd1FUQktVMUoxVkc5dmJIWXdkbkJwWjFKdFluZERUVkZFVURCR1VVSlFUVGhYTWpWWE9UWnNhQ3RyU1VjM1pVVkJRV2M1YkRrS1JWRkRSVnBPTUROdVpFTlpOelEzYkZkbFIzRm5PRlk1T1dzeGNVbEVVV1Y0YWpBOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1663727233,
          "logIndex": 3645726,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3094780000",
      "sha": "ceed27731383d27db2039c22a589b800da81b682"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

