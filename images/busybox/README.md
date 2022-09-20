# busybox

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/busybox/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/busybox/actions/workflows/release.yaml)

An image that contains busybox and musl, suitable for running any binaries that only have a dependency on musl.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/busybox:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1.35.0-r25` `latest` | `sha256:c1b6cf04baddd6c46e1deaaeec533e46cf9b48e779efa35ef33c7e705eb4cf75`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c1b6cf04baddd6c46e1deaaeec533e46cf9b48e779efa35ef33c7e705eb4cf75) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:1c6c1507007c25c6e57df783af556a91befcee822863e77d628452cd92ce6e35`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1c6c1507007c25c6e57df783af556a91befcee822863e77d628452cd92ce6e35) | `amd64` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/busybox:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/busybox:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/busybox"
      },
      "image": {
        "docker-manifest-digest": "sha256:c1b6cf04baddd6c46e1deaaeec533e46cf9b48e779efa35ef33c7e705eb4cf75"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "06ffaf8e6b0d8f5c9b42ab138c99a236cf26a8c2",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIDGo3qzT1dRtgb1cFSaYpVE+9ry0+OkWKk7dMZdDef74AiBwd8cIlNflkvlZkdZaNWvZn+gL4DfMMSePwI+xHV0pag==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4YTZlN2E5ZDQ4ZGU2NjMxMTY0MWMxMzdkMzI3Zjg3NjE2ZDk2NmE3ZmExNzEzOTJjZTUzYmNiOGYwZDUxNTMzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUR0TDhONFRRNjdFWnpVcmZUeWZ4R2RUWUpDZGhVRm1ZTXZpSW5UWnh6MklBSWhBUGNjMXR2aFF1YUhtUlBlZXRyTDRJSnlES2EwRHdBOS90bnJPU2VDWTdJbSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndla05EUVhrMlowRjNTVUpCWjBsVllsaHVWMmxLYmk5MmIwMUxZVEZ6WVdwYUszVkdRWEV5TkVwWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZHTXhUMFJCTWxkb1kwNU5ha2wzVDFSSmQwMVVaM2RQUkVFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZHY2pCRWJIRnRMMGxIT0VobWVtazFlRlF2VjNsWFVtVktNa05YYkZKQlZHdEplalFLSzNkek5VbElhbFZFYlhSeVdHRXJTVVIzYm1aSFZIcDVWQ3RUWXpoQ1ltOUNZa28wZEN0TkwydFZWMWhhVm5wQlozRlBRMEZyTUhkblowcEtUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY2TVZaNENtdHZkbE5FUmxCdGR6UmxPRU50WVZGckwyOVZUak5OZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWtsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVKSVFqRmpNbWQzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRVUmFiVnB0Um0xUFIxVXlXV3BDYTA5SFdURlplbXhwVGtSS2FGbHFSWHBQUjAwMVQxZEZlVTE2V21wYWFra3lDbGxVYUdwTmFrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYmtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKc2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1YVdSWVRqVlpiVGswVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVZGWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpkQ1NHdEJaSGRDTVVGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5NWGROZW05alFVRkJVVVJCUlZsM1VrRkpaMXB4WkhOMFVVOWFOV0owU214eE5Tc0tXR1I1UTJkVWRuWTBNbVJEYmtsUFZuTkdTSFZNYlZOck0ydHZRMGxFVG5neWIwSjNTRmRKUW1RemJrSlNZV3B1YWxodE4yc3hjRFpvUlZKWVpFMWlXUXBqTDNCM1NIVXdaazFCYjBkRFEzRkhVMDAwT1VKQlRVUkJNbU5CVFVkUlEwMUhXbXN2YTNCck9GTTVObXRYTkdWaVVtdFBTWGg2ZWtreldteDRhalZuQ2xSTVZITm1aa1J0Y0VzNFZUSkhha1oxWmxoVVUweHFOVzk2UmxrdllpOUhSbWRKZDBSUVRUSkphak52VTJvdldXeDJVVGRzV1hGYWNuZEhTVWRaVnpjS1kzUkNkVkF3Wm5wNmNFZHRUWEJUVFdacVpXaEJZVXhFY0dadlozVm9PVGR3UzNCdkNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1663696709,
          "logIndex": 3620609,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3092332450",
      "sha": "06ffaf8e6b0d8f5c9b42ab138c99a236cf26a8c2"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

