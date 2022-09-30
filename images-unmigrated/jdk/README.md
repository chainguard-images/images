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
| `latest` | `sha256:32255a90f04d948cf11484ed36c7af6f519e97bc7101c9bf2263e4bc45ef1b7f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:32255a90f04d948cf11484ed36c7af6f519e97bc7101c9bf2263e4bc45ef1b7f) |  |



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
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys

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
        "docker-manifest-digest": "sha256:32255a90f04d948cf11484ed36c7af6f519e97bc7101c9bf2263e4bc45ef1b7f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "500be223f68fed30b862e1c69ef9891d9eab5405",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIEeEheZOceueEfxlvldsB8w5xnix7gZADeBQHzbrB91CAiBBvL0Tp6n6FuB+cyg7CrhjoSfrcUSAWBUdOJxaeH3XFw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyMTM2ZTNiNDk5MTdhNzA1MzJjNThhZjk0ZDdlYzgyMjQ3NTAxOTNjMjczOWM0MzRkNWM0MWE1MTRjNWE5NGM2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNLOXR6cEVhTGFYVVE5N3pRUngwM20zTE9sbkZweGhSS3k4Z1lVeVREb3J3SWhBTWpyT1BJTHlIdUx6a3V1VHpYSHRLNzJCaVcvNW1FWm8yTklGTWdVRFR6ayIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsNVowRjNTVUpCWjBsVlFuQldkMVJQY0hOT1VtSmFkV0V2TlhScldVVlpkakpPUlZwWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVVFhkTlJFbDZUMVJWTlZkb1kwNU5ha2wzVDFSTmQwMUVTVEJQVkZVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZEUlM5SGFXWk9RWEF3UVZGeE9Ua3dhbEJuY2xwemIybEJiMVZ0YVdGU2FVTlBXbFVLV2tVMFRpc3ZhRVZzUTBocFZITjRjelZ3TlZRNWEwTkhRMnRPZUVadVRWRktWME5UVEhaQ0x6VlhaRVpXT1ZVck1YRlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYyYVZwTUNtb3JWVXR2Y2tWaGRFTnRTWFJaWjNaMlNFNXhkVUZCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRsUkJkMWx0VlhsTmFrNXRUbXBvYlZwWFVYcE5SMGswVG1wS2JFMVhUVEpQVjFadFQxUm5OVTFYVVRWYVYwWnBDazVVVVhkT1ZFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkdwRlVGWXpkMEZCUWtGTlFWTkVRa2RCYVVWQlowUnFXVXRTVURGSVoyTnZlRWh6VEhWV1FsSUtSRzluYURCT1ltMW9LMEpMZG5Od016WnhiblZPYVd0RFNWRkVaVEp3T1UxelJWVmFPRmxxSzJsNFUzRllSRGRFVEdabFdYTTJabE55YTJST2IyazJVUXBXS3k5MWRXcEJTMEpuWjNGb2EycFBVRkZSUkVGM1RtOUJSRUpzUVdwRlFUSjViME00VEZnMlpXRXJlRE56ZFdsWVEyMW5ORVpXTVVjeFVVOVVhRUl4Q2s1RmJWSnFOak5UVG05dFptOWpRbVZvVVVwc09EVkdTamwwVG1kSlZEWk1RV3BDVVhaS1YwUk1WVXBhUkZCeVlsZzBVSGx0WjNsTVdXOVJNME56VEZRS1dtMTZUazVuVG5wMk9UZDBNbTFEV0c5eE5qQmhjV2hPVjJadVpHMUhUbTluWkRBOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1664505600,
          "logIndex": 4257858,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3155933088",
      "sha": "500be223f68fed30b862e1c69ef9891d9eab5405"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

